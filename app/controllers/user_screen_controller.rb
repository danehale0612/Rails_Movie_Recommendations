class UserScreenController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    
  end

  def new
    userId = current_user.id
    @send_to_watchlist = UserMovie.create(:title => params[:id], :status => params[:status], :user_id => userId)
    # UserMovie.destroy_all
    redirect_to recommendations_path
  end

end
