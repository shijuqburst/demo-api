class CreatePmsInformations < ActiveRecord::Migration
  def change
    create_table :pms_informations do |t|
      t.string :username
      t.string :password
      t.string :end_point_url
      t.references :pms_type
      t.timestamps
    end
  end
end
