class CreateAuthTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :auth_tokens do |t|
      t.timestamps
    end
  end
end
