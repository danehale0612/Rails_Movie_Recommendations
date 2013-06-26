class WatchListController < ApplicationController

  def index
    @watchlist = get_watch_list
    @poster = get_poster(@watchlist)
  end

  def show
    @movie_title = get_movie_info(params[:id])
  end

  def update
    @movie = UserMovie.where(title: params[:id], user_id: current_user).first
    @movie.update_attributes(status: "already watched list")
    movie_title = params[:id]
    flash[:notice] = "'#{movie_title.titleize}' has been added to 'Already Watched List'"
    redirect_to watch_list_index_path
  end

  def destroy
    @movie = UserMovie.where(title: params[:id], user_id: current_user).first
    @movie.destroy
    movie_title = params[:id]
    flash[:notice] = "'#{movie_title.titleize}' has been deleted from 'Watch List'"
    redirect_to watch_list_index_path
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

  def get_movie_info(movie_title)
    response = Faraday.get "http://www.omdbapi.com/?i=&t=#{movie_title}&plot=full&tomatoes=true"
      movie_info = JSON.parse(response.body)
      movie_info
  end

end
