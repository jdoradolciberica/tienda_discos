require "test_helper"

class Admin::CancionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancion = canciones(:one)
  end

  test "should get index" do
    get admin_canciones_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cancion_url
    assert_response :success
  end

  test "should create cancion" do
    assert_difference("Cancion.count") do
      post admin_canciones_url, params: { cancion: {  } }
    end

    assert_redirected_to admin_cancion_url(Cancion.last)
  end

  test "should show cancion" do
    get admin_cancion_url(@cancion)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cancion_url(@cancion)
    assert_response :success
  end

  test "should update cancion" do
    patch admin_cancion_url(@cancion), params: { cancion: {  } }
    assert_redirected_to admin_cancion_url(@cancion)
  end

  test "should destroy cancion" do
    assert_difference("Cancion.count", -1) do
      delete admin_cancion_url(@cancion)
    end

    assert_redirected_to admin_canciones_url
  end
end
