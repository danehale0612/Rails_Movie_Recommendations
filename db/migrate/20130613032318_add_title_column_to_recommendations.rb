class AddTitleColumnToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :title, :string
  end
end
