require 'test_helper'

class ClientSubstancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_substances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_substance" do
    assert_difference('ClientSubstance.count') do
      post :create, :client_substance => { }
    end

    assert_redirected_to client_substance_path(assigns(:client_substance))
  end

  test "should show client_substance" do
    get :show, :id => client_substances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_substances(:one).to_param
    assert_response :success
  end

  test "should update client_substance" do
    put :update, :id => client_substances(:one).to_param, :client_substance => { }
    assert_redirected_to client_substance_path(assigns(:client_substance))
  end

  test "should destroy client_substance" do
    assert_difference('ClientSubstance.count', -1) do
      delete :destroy, :id => client_substances(:one).to_param
    end

    assert_redirected_to client_substances_path
  end
end
