require "test_helper"

class Admin::ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get admin_clientes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cliente_url
    assert_response :success
  end

  test "should create cliente" do
    assert_difference("Cliente.count") do
      post admin_clientes_url, params: { cliente: {  } }
    end

    assert_redirected_to admin_cliente_url(Cliente.last)
  end

  test "should show cliente" do
    get admin_cliente_url(@cliente)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cliente_url(@cliente)
    assert_response :success
  end

  test "should update cliente" do
    patch admin_cliente_url(@cliente), params: { cliente: {  } }
    assert_redirected_to admin_cliente_url(@cliente)
  end

  test "should destroy cliente" do
    assert_difference("Cliente.count", -1) do
      delete admin_cliente_url(@cliente)
    end

    assert_redirected_to admin_clientes_url
  end
end
