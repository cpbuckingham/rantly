class CreateSpamTable < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.integer :rant_id
      t.integer :user_id
    end
  end
end
