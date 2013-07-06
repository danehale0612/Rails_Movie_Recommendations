class Recommendation < ActiveRecord::Base
  attr_accessible :title

  def self.save_movie_search
    search_movie = Recommendation.last
    search_title = search_movie.title
    search_title
  end

  def self.grab_info(current_user)
    search_title = save_movie_search
    response = Faraday.get "http://www.tastekid.com/ask/ws?q=movie:#{search_title}//movies&format=JSON&f=see_the3022&k=nzfkmgm3nwvm"
    results = JSON.parse(response.body)['Similar']['Results']
    scrubbed_results(results, current_user)
  end

  def self.scrubbed_results(results, current_user)
    scrub_results = []
    results.length.times do |i|
      lowercase_results = results[i]['Name'].downcase
      matched_movie = UserMovie.where(title: lowercase_results, user_id: current_user).first
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
    final_movies = Array.new
    i = 0
    results.each do |result|
      puts result
      resultTitle = result['Name'].gsub(/-/, ' ')
      puts resultTitle
      response = Faraday.get "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=av24wmrhssmy4cnhww8xstcd&q=#{resultTitle}&page_limit=5"
      movie_info = JSON.parse(response.body)
      # binding.pry
      movie_info['movies'].each do |movie|
        final_movies << movie['posters']['detailed'] && break if movie['title'].downcase == resultTitle.downcase
      end
      final_movies << movie_info['movies'][0]['posters']['detailed'] if final_movies[i] == nil
      i = i + 1
    end
    final_movies
  end

  def self.get_movie_info(movie_title)
    response = Faraday.get "http://www.omdbapi.com/", { :t => movie_title, :plot => "full", :tomatoes => "true" }
      movie_info = JSON.parse(response.body)
      movie_info
  end

end
