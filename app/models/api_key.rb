class ApiKey < ActiveRecord::Base
  attr_accessible :api_key, :application_type, :application_version, :expiry_date
end
