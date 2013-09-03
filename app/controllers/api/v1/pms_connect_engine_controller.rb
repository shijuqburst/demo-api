module Api
  module V1
    class PmsConnectEngineController < ApplicationController
      include JsonValidator
      before_filter :validate_json_data, :only=>[:checkin]
      def initialize

      end

      def login
        begin
          api_req_data = ActiveSupport::JSON.decode(request.body)
          user_name = api_req_data["user_name"]
          password = api_req_data["password"]
          user = User.find_by_username_and_password(user_name,password)
          api_key = ApiKey.find_by_api_key(api_req_data["api_key"])
          if user.nil?
            raise " User Name/Password not matching, Please check again!!"
          elsif api_key.nil?
            raise "API key is not matching with the current checkin process!!"
          else
            render :json => {:session_token=>user.sessions[0].token, :status =>"success"}
          end
        rescue Exception => e
          render :json => {:message=>e.message, :status =>"failure"}
        end

      end

      def checkin
        begin
          if request.method != "POST"
            raise "Checkin Applicaiton support only POST method"
          end
          api_req_data = ActiveSupport::JSON.decode(request.body)
          if api_req_data["session_token"].nil?
            raise "Session Token is not received as parameter"
          end
          session_token  = api_req_data["session_token"]
          session_token_object = Session.find_by_token(session_token)
          if session_token_object.nil?
            raise "Session Token is not matching/Expired"
          end

          pms_connector_class = find_pms_for_hotel(api_req_data["hotel_code"])
          if pms_connector_class.nil?
            raise "Hotel Chain Code not matching"
          end

          pms_connector = pms_connector_class.new(api_req_data)

          json_response = pms_connector.checkin(api_req_data["resv_name_id"], api_req_data["hotel_code"],
          api_req_data["chain_code"])
          render :json => {:message=>json_response, :status =>"success"}
        rescue Exception =>e
          render :json => {:message=>e.message, :status =>"failure"}
        end
      end

      def checkout
        #TODO: Checkout API code will placed here
        render :json => "Checkout API"
      end

      private

      def find_pms_for_hotel(hotel_chain)
        @pms_information = PmsInformation.by_hotel_chain(hotel_chain).first
        pms_connector = Object.const_get @pms_information.pms_type.pms_connector_class
        return pms_connector

      end

    end

  end
end
