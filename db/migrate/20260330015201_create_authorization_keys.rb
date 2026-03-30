class CreateAuthorizationKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :authorization_keys do |t|
      t.datetime :expiry
      t.string :token
      t.string :user_agent
      t.string :authable_type
      t.bigint :authable_id

      t.timestamps
    end
  end
end
