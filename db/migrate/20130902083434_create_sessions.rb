class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :token
      t.integer :expiry_time
      t.references :user
      t.timestamps
    end
  end
end
