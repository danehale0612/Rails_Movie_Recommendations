class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|

      t.timestamps
    end
  end
end
