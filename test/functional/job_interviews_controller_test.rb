require 'test_helper'

class JobInterviewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_interviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_interview" do
    assert_difference('JobInterview.count') do
      post :create, :job_interview => { }
    end

    assert_redirected_to job_interview_path(assigns(:job_interview))
  end

  test "should show job_interview" do
    get :show, :id => job_interviews(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => job_interviews(:one).to_param
    assert_response :success
  end

  test "should update job_interview" do
    put :update, :id => job_interviews(:one).to_param, :job_interview => { }
    assert_redirected_to job_interview_path(assigns(:job_interview))
  end

  test "should destroy job_interview" do
    assert_difference('JobInterview.count', -1) do
      delete :destroy, :id => job_interviews(:one).to_param
    end

    assert_redirected_to job_interviews_path
  end
end
