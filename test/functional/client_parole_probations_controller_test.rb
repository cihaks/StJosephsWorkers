require 'test_helper'

class ClientParoleProbationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_parole_probations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_parole_probation" do
    assert_difference('ClientParoleProbation.count') do
      post :create, :client_parole_probation => { }
    end

    assert_redirected_to client_parole_probation_path(assigns(:client_parole_probation))
  end

  test "should show client_parole_probation" do
    get :show, :id => client_parole_probations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_parole_probations(:one).to_param
    assert_response :success
  end

  test "should update client_parole_probation" do
    put :update, :id => client_parole_probations(:one).to_param, :client_parole_probation => { }
    assert_redirected_to client_parole_probation_path(assigns(:client_parole_probation))
  end

  test "should destroy client_parole_probation" do
    assert_difference('ClientParoleProbation.count', -1) do
      delete :destroy, :id => client_parole_probations(:one).to_param
    end

    assert_redirected_to client_parole_probations_path
  end
end
