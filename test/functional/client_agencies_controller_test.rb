require 'test_helper'

class ClientAgenciesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_agency" do
    assert_difference('ClientAgency.count') do
      post :create, :client_agency => { }
    end

    assert_redirected_to client_agency_path(assigns(:client_agency))
  end

  test "should show client_agency" do
    get :show, :id => client_agencies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_agencies(:one).to_param
    assert_response :success
  end

  test "should update client_agency" do
    put :update, :id => client_agencies(:one).to_param, :client_agency => { }
    assert_redirected_to client_agency_path(assigns(:client_agency))
  end

  test "should destroy client_agency" do
    assert_difference('ClientAgency.count', -1) do
      delete :destroy, :id => client_agencies(:one).to_param
    end

    assert_redirected_to client_agencies_path
  end
end
