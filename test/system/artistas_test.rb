require "application_system_test_case"

class ArtistaTest < ApplicationSystemTestCase
  setup do
    @artista = artistas(:one)
  end

  test "visiting the index" do
    visit artistas_url
    assert_selector "h1", text: "Artista"
  end

  test "should create artista" do
    visit artistas_url
    click_on "New artista"

    click_on "Create Artista"

    assert_text "Artista was successfully created"
    click_on "Back"
  end

  test "should update Artista" do
    visit artista_url(@artista)
    click_on "Edit this artista", match: :first

    click_on "Update Artista"

    assert_text "Artista was successfully updated"
    click_on "Back"
  end

  test "should destroy Artista" do
    visit artista_url(@artista)
    click_on "Destroy this artista", match: :first

    assert_text "Artista was successfully destroyed"
  end
end
