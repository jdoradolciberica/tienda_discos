require "test_helper"

class Admin::ArtistasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artista = artistas(:one)
  end

  test "should get index" do
    get admin_artistas_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_artista_url
    assert_response :success
  end

  test "should create artista" do
    assert_difference("Artista.count") do
      post admin_artistas_url, params: { artista: {  } }
    end

    assert_redirected_to admin_artista_url(Artista.last)
  end

  test "should show artista" do
    get admin_artista_url(@artista)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_artista_url(@artista)
    assert_response :success
  end

  test "should update artista" do
    patch admin_artista_url(@artista), params: { artista: {  } }
    assert_redirected_to admin_artista_url(@artista)
  end

  test "should destroy artista" do
    assert_difference("Artista.count", -1) do
      delete admin_artista_url(@artista)
    end

    assert_redirected_to admin_artistas_url
  end
end
