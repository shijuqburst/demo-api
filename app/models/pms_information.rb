class PmsInformation < ActiveRecord::Base
  belongs_to :pms_type
  has_many :hotel_chains
  attr_accessible :end_point_url, :password, :username


  scope :by_hotel_chain, lambda { |hotel_chain| {:joins=>:hotel_chains , :conditions => ["hotel_chains.chain_name = ?", hotel_chain] ,:include => [:hotel_chains] }}

end
