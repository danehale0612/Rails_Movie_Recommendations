class WatchList < ActiveRecord::Base
  # attr_accessible :title

  def self.get_watch_list(current_user)
    title_list = []
    watchList = UserMovie.where(status: "watchlist", user_id: current_user.id).all
    watchList.each do |movie|
      title_list << movie.title.gsub(/:/, '')
    end
    title_list
  end

  def self.get_poster(results)
    movie_results = []
    final_movies = Array.new
    i = 0
    results.each do |result|
      response = Faraday.get "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=av24wmrhssmy4cnhww8xstcd&q=#{result}&page_limit=5"
      movie_info = JSON.parse(response.body)
      # binding.pry
      movie_info['movies'].each do |movie|
        final_movies << movie && break if movie['title'].downcase == result
      end
      final_movies << movie_info['movies'][0] if final_movies[i] == nil
      i = i + 1
    end
    final_movies
  end

  def self.get_movie_info(movie_title)
    response = Faraday.get "http://www.omdbapi.com/?s=#{movie_title}"
    movie_info = JSON.parse(response.body)
    movie_imdbID = movie_info['Search'][0]['imdbID']
    response = Faraday.get "http://www.omdbapi.com/?i=#{movie_imdbID}&plot=full&tomatoes=true"
    movie_info = JSON.parse(response.body) 
    movie_info
  end

  def self.get_individual_poster(result)
    movie_results = []
    final_movies = Array.new
    i = 0
    response = Faraday.get "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=av24wmrhssmy4cnhww8xstcd&q=#{result}&page_limit=5"
    movie_info = JSON.parse(response.body)
    # binding.pry
    movie_info['movies'].each do |movie|
      final_movies << movie && break if movie['title'].downcase == result.downcase
    end
    final_movies << movie_info['movies'][0] if final_movies[i] == nil
    i = i + 1
    final_movies
  end
  
  
end
