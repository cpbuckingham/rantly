class Renametableemailconfirmations < ActiveRecord::Migration
  def change
    rename_table(:email_confirmations, :email_confirmers)
  end
end
