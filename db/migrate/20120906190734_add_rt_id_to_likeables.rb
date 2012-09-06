class AddRtIdToLikeables < ActiveRecord::Migration
  def change
    add_column :likeables, :rt_id, :integer
  end
end
