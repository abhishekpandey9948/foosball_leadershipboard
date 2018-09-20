require 'test_helper'

class NayyarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nayyar = nayyars(:one)
  end

  test "should get index" do
    get nayyars_url
    assert_response :success
  end

  test "should get new" do
    get new_nayyar_url
    assert_response :success
  end

  test "should create nayyar" do
    assert_difference('Nayyar.count') do
      post nayyars_url, params: { nayyar: { age: @nayyar.age, name: @nayyar.name } }
    end

    assert_redirected_to nayyar_url(Nayyar.last)
  end

  test "should show nayyar" do
    get nayyar_url(@nayyar)
    assert_response :success
  end

  test "should get edit" do
    get edit_nayyar_url(@nayyar)
    assert_response :success
  end

  test "should update nayyar" do
    patch nayyar_url(@nayyar), params: { nayyar: { age: @nayyar.age, name: @nayyar.name } }
    assert_redirected_to nayyar_url(@nayyar)
  end

  test "should destroy nayyar" do
    assert_difference('Nayyar.count', -1) do
      delete nayyar_url(@nayyar)
    end

    assert_redirected_to nayyars_url
  end
end
