class Session < ActiveRecord::Base
  attr_accessible :expiry_time, :token
  belongs_to :user
  before_create :generate_token

  def generate_token
    self.token = Digest::MD5.hexdigest("wizards#{Time.now}:killed:#{self.user_id}:my_family:#{rand(15562)}")
    token
  end
end
