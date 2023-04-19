require "test_helper"

class Admin::DiscoPedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disco_pedido = disco_pedidos(:one)
  end

  test "should get index" do
    get admin_disco_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_disco_pedido_url
    assert_response :success
  end

  test "should create disco_pedido" do
    assert_difference("DiscoPedido.count") do
      post admin_disco_pedidos_url, params: { disco_pedido: {  } }
    end

    assert_redirected_to admin_disco_pedido_url(DiscoPedido.last)
  end

  test "should show disco_pedido" do
    get admin_disco_pedido_url(@disco_pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_disco_pedido_url(@disco_pedido)
    assert_response :success
  end

  test "should update disco_pedido" do
    patch admin_disco_pedido_url(@disco_pedido), params: { disco_pedido: {  } }
    assert_redirected_to admin_disco_pedido_url(@disco_pedido)
  end

  test "should destroy disco_pedido" do
    assert_difference("DiscoPedido.count", -1) do
      delete admin_disco_pedido_url(@disco_pedido)
    end

    assert_redirected_to admin_disco_pedidos_url
  end
end
