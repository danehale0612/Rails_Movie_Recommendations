class RecommendationsController < ApplicationController

  def index
    @results = Recommendation.grab_info
    @user = current_user
    @poster = Recommendation.get_poster(@results)
    @movie = Recommendation.last
    @search_title = Recommendation.save_movie_search
  end

  def create
    @recommendation = Recommendation.create(params[:recommendation])
    redirect_to recommendations_path
  end

  def show
    @movie_title = Recommendation.get_movie_info(params[:id])
  end

end
