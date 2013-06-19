class AddTitleUserIdToUserMovie < ActiveRecord::Migration
  def change
    add_column :user_movies, :title, :string
    add_column :user_movies, :user_id, :integer
  end
end
