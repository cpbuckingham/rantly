class IndexingFollowingTable < ActiveRecord::Migration
  def change
    add_index :follows, [:follow_id, :user_id], :unique => true
  end
end
