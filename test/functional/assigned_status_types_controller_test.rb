require 'test_helper'

class AssignedStatusTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assigned_status_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assigned_status_type" do
    assert_difference('AssignedStatusType.count') do
      post :create, :assigned_status_type => { }
    end

    assert_redirected_to assigned_status_type_path(assigns(:assigned_status_type))
  end

  test "should show assigned_status_type" do
    get :show, :id => assigned_status_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => assigned_status_types(:one).to_param
    assert_response :success
  end

  test "should update assigned_status_type" do
    put :update, :id => assigned_status_types(:one).to_param, :assigned_status_type => { }
    assert_redirected_to assigned_status_type_path(assigns(:assigned_status_type))
  end

  test "should destroy assigned_status_type" do
    assert_difference('AssignedStatusType.count', -1) do
      delete :destroy, :id => assigned_status_types(:one).to_param
    end

    assert_redirected_to assigned_status_types_path
  end
end
