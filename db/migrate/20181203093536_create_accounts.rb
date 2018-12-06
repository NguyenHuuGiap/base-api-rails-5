class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account, null: false
      t.string :password_digest, null: false
      t.string :before_password, null: false
      t.string :init_password, null: false
      t.integer :staff_role, null: false, default: 0
      t.datetime :account_created
      t.datetime :account_stoped
      t.integer :account_div, default: 1
      t.integer :log_miss_count, default: 0
      t.integer :account_lock,  default: 0
      t.datetime :lockout_time
      t.datetime :unlocked_time

      t.timestamps
    end
  end
end
