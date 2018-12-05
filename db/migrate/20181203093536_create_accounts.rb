class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
