require 'test_helper'

class ClientPhonesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_phone" do
    assert_difference('ClientPhone.count') do
      post :create, :client_phone => { }
    end

    assert_redirected_to client_phone_path(assigns(:client_phone))
  end

  test "should show client_phone" do
    get :show, :id => client_phones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_phones(:one).to_param
    assert_response :success
  end

  test "should update client_phone" do
    put :update, :id => client_phones(:one).to_param, :client_phone => { }
    assert_redirected_to client_phone_path(assigns(:client_phone))
  end

  test "should destroy client_phone" do
    assert_difference('ClientPhone.count', -1) do
      delete :destroy, :id => client_phones(:one).to_param
    end

    assert_redirected_to client_phones_path
  end
end
