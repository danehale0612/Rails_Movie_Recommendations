class AlreadyWatchedList < ActiveRecord::Base
  # attr_accessible :title

  def self.get_already_watched_list(current_user)
    title_list = []
    watchList = UserMovie.where(status: "already watched list", user_id: current_user.id).all
    watchList.each do |movie|
      title_list << movie.title
    end
    title_list
  end

  def self.get_poster(results)
    movie_results = []
    final_movies = []
    results.each do |result|
      resultTitle = result
      response = Faraday.get "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=av24wmrhssmy4cnhww8xstcd&q=#{result}&page_limit=5"
      movie_info['movies'].each do |movie|
        final_movies << movie if movie['title'].downcase == resultTitle.downcase
      end
    end
    final_movies
  end

  def self.get_movie_info(movie_title)
    response = Faraday.get "http://www.omdbapi.com/?i=&t=#{movie_title}&plot=full&tomatoes=true"
      movie_info = JSON.parse(response.body)
      movie_info
  end
  
  
end