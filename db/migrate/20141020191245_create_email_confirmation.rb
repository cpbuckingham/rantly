class CreateEmailConfirmation < ActiveRecord::Migration
  def change
    create_table :email_confirmations do |t|
        t.integer :user_id
        t.string :confirmation_token
    end
  end
end
