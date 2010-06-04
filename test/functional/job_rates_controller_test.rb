require 'test_helper'

class JobRatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_rate" do
    assert_difference('JobRate.count') do
      post :create, :job_rate => { }
    end

    assert_redirected_to job_rate_path(assigns(:job_rate))
  end

  test "should show job_rate" do
    get :show, :id => job_rates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => job_rates(:one).to_param
    assert_response :success
  end

  test "should update job_rate" do
    put :update, :id => job_rates(:one).to_param, :job_rate => { }
    assert_redirected_to job_rate_path(assigns(:job_rate))
  end

  test "should destroy job_rate" do
    assert_difference('JobRate.count', -1) do
      delete :destroy, :id => job_rates(:one).to_param
    end

    assert_redirected_to job_rates_path
  end
end
