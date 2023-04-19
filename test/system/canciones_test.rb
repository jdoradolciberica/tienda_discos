require "application_system_test_case"

class CancionsTest < ApplicationSystemTestCase
  setup do
    @cancion = canciones(:one)
  end

  test "visiting the index" do
    visit canciones_url
    assert_selector "h1", text: "Cancions"
  end

  test "should create cancion" do
    visit canciones_url
    click_on "New cancion"

    click_on "Create Cancion"

    assert_text "Cancion was successfully created"
    click_on "Back"
  end

  test "should update Cancion" do
    visit cancion_url(@cancion)
    click_on "Edit this cancion", match: :first

    click_on "Update Cancion"

    assert_text "Cancion was successfully updated"
    click_on "Back"
  end

  test "should destroy Cancion" do
    visit cancion_url(@cancion)
    click_on "Destroy this cancion", match: :first

    assert_text "Cancion was successfully destroyed"
  end
end
