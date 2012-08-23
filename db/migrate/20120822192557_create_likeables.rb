class CreateLikeables < ActiveRecord::Migration
  def change
    create_table :likeables do |t|
      t.string :name

      t.timestamps
    end
  end
end
