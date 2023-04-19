require "application_system_test_case"

class DiscoPedidosTest < ApplicationSystemTestCase
  setup do
    @disco_pedido = disco_pedidos(:one)
  end

  test "visiting the index" do
    visit disco_pedidos_url
    assert_selector "h1", text: "Disco pedidos"
  end

  test "should create disco pedido" do
    visit disco_pedidos_url
    click_on "New disco pedido"

    click_on "Create Disco pedido"

    assert_text "Disco pedido was successfully created"
    click_on "Back"
  end

  test "should update Disco pedido" do
    visit disco_pedido_url(@disco_pedido)
    click_on "Edit this disco pedido", match: :first

    click_on "Update Disco pedido"

    assert_text "Disco pedido was successfully updated"
    click_on "Back"
  end

  test "should destroy Disco pedido" do
    visit disco_pedido_url(@disco_pedido)
    click_on "Destroy this disco pedido", match: :first

    assert_text "Disco pedido was successfully destroyed"
  end
end
