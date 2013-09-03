require 'test_helper'

class PmsConnectEngineControllerTest < ActionController::TestCase
  test "should get checkin" do
    get :checkin
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get find_pms_for_hotle" do
    get :find_pms_for_hotle
    assert_response :success
  end

  test "should get pms_connector" do
    get :pms_connector
    assert_response :success
  end

end
