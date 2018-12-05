class CreateAuthTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :auth_tokens do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end
