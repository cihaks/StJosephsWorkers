require 'test_helper'

class StatusTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_type" do
    assert_difference('StatusType.count') do
      post :create, :status_type => { }
    end

    assert_redirected_to status_type_path(assigns(:status_type))
  end

  test "should show status_type" do
    get :show, :id => status_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => status_types(:one).to_param
    assert_response :success
  end

  test "should update status_type" do
    put :update, :id => status_types(:one).to_param, :status_type => { }
    assert_redirected_to status_type_path(assigns(:status_type))
  end

  test "should destroy status_type" do
    assert_difference('StatusType.count', -1) do
      delete :destroy, :id => status_types(:one).to_param
    end

    assert_redirected_to status_types_path
  end
end
