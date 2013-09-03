class CreatePmsTypes < ActiveRecord::Migration
  def change
    create_table :pms_types do |t|
      t.string :pms_type_code
      t.string :pms_type_name
      t.string :pms_connector_class
      t.timestamps
    end
  end
end
