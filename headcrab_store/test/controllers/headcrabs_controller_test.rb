require 'test_helper'

class HeadcrabsControllerTest < ActionController::TestCase
  setup do
    @headcrab = headcrabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headcrabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headcrab" do
    assert_difference('Headcrab.count') do
      post :create, headcrab: { birthday: @headcrab.birthday, description: @headcrab.description, name: @headcrab.name, pic_url: @headcrab.pic_url, price: @headcrab.price }
    end

    assert_redirected_to headcrab_path(assigns(:headcrab))
  end

  test "should show headcrab" do
    get :show, id: @headcrab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @headcrab
    assert_response :success
  end

  test "should update headcrab" do
    patch :update, id: @headcrab, headcrab: { birthday: @headcrab.birthday, description: @headcrab.description, name: @headcrab.name, pic_url: @headcrab.pic_url, price: @headcrab.price }
    assert_redirected_to headcrab_path(assigns(:headcrab))
  end

  test "should destroy headcrab" do
    assert_difference('Headcrab.count', -1) do
      delete :destroy, id: @headcrab
    end

    assert_redirected_to headcrabs_path
  end
end
