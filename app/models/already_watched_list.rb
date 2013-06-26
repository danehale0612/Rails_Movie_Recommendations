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
    results.each do |result|
      response = Faraday.get "http://www.omdbapi.com/?i=&t=#{result}"
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