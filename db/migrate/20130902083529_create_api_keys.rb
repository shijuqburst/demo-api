class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :application_type
      t.string :application_version
      t.string :api_key
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
