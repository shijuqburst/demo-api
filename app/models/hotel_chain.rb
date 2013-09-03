class HotelChain < ActiveRecord::Base
  belongs_to :pms_information
  attr_accessible :chain_code, :chain_name
end
