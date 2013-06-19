class RecommendationSearchController < ApplicationController

  def index
    @recommendation = Recommendation.new
    @recommendations = Recommendation.all
    @clear_recommend_search = Recommendation.destroy_all
  end

end
