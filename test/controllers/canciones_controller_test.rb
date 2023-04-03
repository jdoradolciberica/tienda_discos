require "test_helper"

class CancionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cancion = canciones(:one)
  end

  test "should get index" do
    get canciones_url
    assert_response :success
  end

  test "should get new" do
    get new_cancion_url
    assert_response :success
  end

  test "should create cancion" do
    assert_difference("Cancion.count") do
      post canciones_url, params: { cancion: { disco_id: @cancion.disco_id, duracion: @cancion.duracion, titulo: @cancion.titulo } }
    end

    assert_redirected_to cancion_url(Cancion.last)
  end

  test "should show cancion" do
    get cancion_url(@cancion)
    assert_response :success
  end

  test "should get edit" do
    get edit_cancion_url(@cancion)
    assert_response :success
  end

  test "should update cancion" do
    patch cancion_url(@cancion), params: { cancion: { disco_id: @cancion.disco_id, duracion: @cancion.duracion, titulo: @cancion.titulo } }
    assert_redirected_to cancion_url(@cancion)
  end

  test "should destroy cancion" do
    assert_difference("Cancion.count", -1) do
      delete cancion_url(@cancion)
    end

    assert_redirected_to canciones_url
  end
end
