require "test_helper"

class Admin::DiscosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disco = discos(:one)
  end

  test "should get index" do
    get admin_discos_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_disco_url
    assert_response :success
  end

  test "should create disco" do
    assert_difference("Disco.count") do
      post admin_discos_url, params: { disco: {  } }
    end

    assert_redirected_to admin_disco_url(Disco.last)
  end

  test "should show disco" do
    get admin_disco_url(@disco)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_disco_url(@disco)
    assert_response :success
  end

  test "should update disco" do
    patch admin_disco_url(@disco), params: { disco: {  } }
    assert_redirected_to admin_disco_url(@disco)
  end

  test "should destroy disco" do
    assert_difference("Disco.count", -1) do
      delete admin_disco_url(@disco)
    end

    assert_redirected_to admin_discos_url
  end
end
