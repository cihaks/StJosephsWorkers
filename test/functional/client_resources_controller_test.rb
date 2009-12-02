require 'test_helper'

class ClientResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_resource" do
    assert_difference('ClientResource.count') do
      post :create, :client_resource => { }
    end

    assert_redirected_to client_resource_path(assigns(:client_resource))
  end

  test "should show client_resource" do
    get :show, :id => client_resources(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_resources(:one).to_param
    assert_response :success
  end

  test "should update client_resource" do
    put :update, :id => client_resources(:one).to_param, :client_resource => { }
    assert_redirected_to client_resource_path(assigns(:client_resource))
  end

  test "should destroy client_resource" do
    assert_difference('ClientResource.count', -1) do
      delete :destroy, :id => client_resources(:one).to_param
    end

    assert_redirected_to client_resources_path
  end
end
