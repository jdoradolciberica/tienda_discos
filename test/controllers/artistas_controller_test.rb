require "test_helper"

class ArtistasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artista = artistas(:one)
  end

  test "should get index" do
    get artistas_url
    assert_response :success
  end

  test "should get new" do
    get new_artista_url
    assert_response :success
  end

  test "should create artista" do
    assert_difference("Artista.count") do
      post artistas_url, params: { artista: { fecha_nacimiento: @artista.fecha_nacimiento, nombre: @artista.nombre, procedencia: @artista.procedencia } }
    end

    assert_redirected_to artista_url(Artista.last)
  end

  test "should show artista" do
    get artista_url(@artista)
    assert_response :success
  end

  test "should get edit" do
    get edit_artista_url(@artista)
    assert_response :success
  end

  test "should update artista" do
    patch artista_url(@artista), params: { artista: { fecha_nacimiento: @artista.fecha_nacimiento, nombre: @artista.nombre, procedencia: @artista.procedencia } }
    assert_redirected_to artista_url(@artista)
  end

  test "should destroy artista" do
    assert_difference("Artista.count", -1) do
      delete artista_url(@artista)
    end

    assert_redirected_to artistas_url
  end
end
