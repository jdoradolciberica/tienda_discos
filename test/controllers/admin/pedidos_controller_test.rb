require "test_helper"

class Admin::PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
  end

  test "should get index" do
    get admin_pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference("Pedido.count") do
      post admin_pedidos_url, params: { pedido: {  } }
    end

    assert_redirected_to admin_pedido_url(Pedido.last)
  end

  test "should show pedido" do
    get admin_pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch admin_pedido_url(@pedido), params: { pedido: {  } }
    assert_redirected_to admin_pedido_url(@pedido)
  end

  test "should destroy pedido" do
    assert_difference("Pedido.count", -1) do
      delete admin_pedido_url(@pedido)
    end

    assert_redirected_to admin_pedidos_url
  end
end
