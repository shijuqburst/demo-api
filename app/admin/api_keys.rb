ActiveAdmin.register ApiKey do
  form do |f|
    f.inputs "API Key Details" do
      f.input :application_type
      f.input :application_version
    end
    f.buttons
  end

  controller do
    alias_method :create_api_key, :create
    def create
      @api_key = ApiKey.new(params[:api_key])
      @api_key.api_key = SecureRandom.hex
      @api_key.expiry_date = 10.days.from_now
      create_api_key
    end
  end

end
