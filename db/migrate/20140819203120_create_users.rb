class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :rant_frequency
    end
  end
end
