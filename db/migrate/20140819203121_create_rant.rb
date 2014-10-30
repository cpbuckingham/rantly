class CreateRant < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title
      t.text :content
      t.integer :user_id
    end
  end
end
