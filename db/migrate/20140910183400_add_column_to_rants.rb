class AddColumnToRants < ActiveRecord::Migration
  def change
    add_column :rants, :created_at, :timestamp
  end
end
