class AlreadyWatchedListController < ApplicationController

  def index
    @alreadywatchedlist = AlreadyWatchedList.get_already_watched_list(current_user)
    @poster = AlreadyWatchedList.get_poster(@alreadywatchedlist)
  end

  def show
    @movie_title = AlreadyWatchedList.get_movie_info(params[:id])
  end

  def update
    @movie = UserMovie.where(title: params[:id], user_id: current_user).first
    @movie.update_attributes(status: "watchlist")
    movie_title = params[:id]
    flash[:notice] = "'#{movie_title.titleize}' has been added to 'Watch List'"
    redirect_to already_watched_list_index_path
  end

  def destroy
    @movie = UserMovie.where(title: params[:id], user_id: current_user).first
    @movie.destroy
    movie_title = params[:id]
    flash[:notice] = "'#{movie_title.titleize}' has been deleted from 'Already Watched List'"
    redirect_to already_watched_list_index_path
  end

end
