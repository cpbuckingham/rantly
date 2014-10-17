class ChangeLimitToRants < ActiveRecord::Migration
  def change
    change_column :rants, :content, :text
  end
end
