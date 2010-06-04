require 'test_helper'

class ActivityLogsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_log" do
    assert_difference('ActivityLog.count') do
      post :create, :activity_log => { }
    end

    assert_redirected_to activity_log_path(assigns(:activity_log))
  end

  test "should show activity_log" do
    get :show, :id => activity_logs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => activity_logs(:one).to_param
    assert_response :success
  end

  test "should update activity_log" do
    put :update, :id => activity_logs(:one).to_param, :activity_log => { }
    assert_redirected_to activity_log_path(assigns(:activity_log))
  end

  test "should destroy activity_log" do
    assert_difference('ActivityLog.count', -1) do
      delete :destroy, :id => activity_logs(:one).to_param
    end

    assert_redirected_to activity_logs_path
  end
end
