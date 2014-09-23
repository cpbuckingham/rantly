class AddFavoriteColumnForRants < ActiveRecord::Migration
  def change
    add_column :rants, :favorite, :string

  end
end
