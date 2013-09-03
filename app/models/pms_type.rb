class PmsType < ActiveRecord::Base
  has_one :pms_information
  attr_accessible :pms_type_code, :pms_type_name,:pms_connector_class
end
