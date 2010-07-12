require 'test_helper'

class AppInterviewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_interview" do
    assert_difference('AppInterview.count') do
      post :create, :app_interview => { }
    end

    assert_redirected_to app_interview_path(assigns(:app_interview))
  end

  test "should show app_interview" do
    get :show, :id => app_interviews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => app_interviews(:one).to_param
    assert_response :success
  end

  test "should update app_interview" do
    put :update, :id => app_interviews(:one).to_param, :app_interview => { }
    assert_redirected_to app_interview_path(assigns(:app_interview))
  end

  test "should destroy app_interview" do
    assert_difference('AppInterview.count', -1) do
      delete :destroy, :id => app_interviews(:one).to_param
    end

    assert_redirected_to app_interviews_path
  end
end
