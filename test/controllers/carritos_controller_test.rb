require "test_helper"

class CarritosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carritos_show_url
    assert_response :success
  end

  test "should get agregar" do
    get carritos_agregar_url
    assert_response :success
  end

  test "should get quitar" do
    get carritos_quitar_url
    assert_response :success
  end

  test "should get menos" do
    get carritos_menos_url
    assert_response :success
  end

  test "should get mas" do
    get carritos_mas_url
    assert_response :success
  end

  test "should get vaciar" do
    get carritos_vaciar_url
    assert_response :success
  end
end
