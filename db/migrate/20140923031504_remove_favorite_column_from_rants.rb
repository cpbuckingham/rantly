class RemoveFavoriteColumnFromRants < ActiveRecord::Migration
  def change
      remove_column :rants, :favorite, :string
    end
end
