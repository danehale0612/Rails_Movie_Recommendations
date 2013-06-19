class Recommendation < ActiveRecord::Base
  attr_accessible :title

  def self.save_movie_search
    search_movie = Recommendation.last
    search_title = search_movie.title
    search_title
  end

  def self.grab_info
    search_title = save_movie_search
    response = Faraday.get "http://www.tastekid.com/ask/ws?q=movie:#{search_title}//movies&format=JSON&f=see_the3022&k=nzfkmgm3nwvm"
    results = JSON.parse(response.body)['Similar']['Results']
    scrubbed_results(results)
  end

  def self.scrubbed_results(results)
    scrub_results = []
    results.length.times do |i|
      lowercase_results = results[i]['Name'].downcase
      matched_movie = UserMovie.where(title: lowercase_results, user_id: @userID).first
      scrub_results << results[i] if matched_movie.nil?
    end 
    get_top_five_movies(scrub_results)
  end

  def self.get_top_five_movies(scrub_results)
    top_five_movies = scrub_results.shift(5)
    top_five_movies.each_with_index do |movie, index|
      movie['Index'] = index + 1
    end
    top_five_movies
  end

  def self.get_poster(results)
    movie_results = []
    results.each do |result|
      response = Faraday.get "http://www.omdbapi.com/?i=&t=#{result['Name']}"
      movie_info = JSON.parse(response.body)
      movie_results << movie_info
    end
    movie_results
  end

  def self.get_movie_info(movie_title)
    response = Faraday.get "http://www.omdbapi.com/?i=&t=#{movie_title}&plot=full&tomatoes=true"
      movie_info = JSON.parse(response.body)
      movie_info
  end

end
