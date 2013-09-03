class CreateHotelChains < ActiveRecord::Migration
  def change
    create_table :hotel_chains do |t|
      t.string :chain_code
      t.string :chain_name
      t.references :pms_information
      t.timestamps
    end
  end
end
