class AddStatusToUserMovie < ActiveRecord::Migration
  def change
    add_column :user_movies, :status, :string
  end
end
