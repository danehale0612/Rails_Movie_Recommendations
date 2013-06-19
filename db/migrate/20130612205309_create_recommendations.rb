class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|

      t.timestamps
    end
  end
end
