require "test_helper"

class Admin::SesionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sesiones_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_sesiones_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_sesiones_destroy_url
    assert_response :success
  end
end
