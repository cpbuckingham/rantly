class CreateSearchesTable < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search
    end
  end
end

