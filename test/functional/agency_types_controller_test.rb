require 'test_helper'

class AgencyTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agency_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agency_type" do
    assert_difference('AgencyType.count') do
      post :create, :agency_type => { }
    end

    assert_redirected_to agency_type_path(assigns(:agency_type))
  end

  test "should show agency_type" do
    get :show, :id => agency_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => agency_types(:one).to_param
    assert_response :success
  end

  test "should update agency_type" do
    put :update, :id => agency_types(:one).to_param, :agency_type => { }
    assert_redirected_to agency_type_path(assigns(:agency_type))
  end

  test "should destroy agency_type" do
    assert_difference('AgencyType.count', -1) do
      delete :destroy, :id => agency_types(:one).to_param
    end

    assert_redirected_to agency_types_path
  end
end
