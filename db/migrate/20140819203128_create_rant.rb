class CreateRant < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title
      t.string :content
      t.integer :rant_id
    end
  end
end
