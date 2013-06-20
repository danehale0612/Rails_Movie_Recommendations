class WatchListController < ApplicationController

  def index
    @watchlist = get_watch_list
    @poster = get_poster(@watchlist)
  end

  def get_watch_list
    title_list = []
    watchList = UserMovie.where(status: "watchlist", user_id: current_user.id).all
    watchList.each do |movie|
      title_list << movie.title
    end
    title_list
  end

  def get_poster(results)
    movie_results = []
    results.each do |result|
      response = Faraday.get "http://www.omdbapi.com/?i=&t=#{result}"
      movie_info = JSON.parse(response.body)
      movie_results << movie_info
    end
    movie_results
  end

end
