class WatchListController < ApplicationController

  def index
    @watchlist = WatchList.get_watch_list(current_user)
    @poster = WatchList.get_poster(@watchlist)
  end

  def show
    @movie_title = WatchList.get_movie_info(params[:id])
    @individualPoster = WatchList.get_individual_poster(params[:id])
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

end
