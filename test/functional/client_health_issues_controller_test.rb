require 'test_helper'

class ClientHealthIssuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_health_issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_health_issue" do
    assert_difference('ClientHealthIssue.count') do
      post :create, :client_health_issue => { }
    end

    assert_redirected_to client_health_issue_path(assigns(:client_health_issue))
  end

  test "should show client_health_issue" do
    get :show, :id => client_health_issues(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_health_issues(:one).to_param
    assert_response :success
  end

  test "should update client_health_issue" do
    put :update, :id => client_health_issues(:one).to_param, :client_health_issue => { }
    assert_redirected_to client_health_issue_path(assigns(:client_health_issue))
  end

  test "should destroy client_health_issue" do
    assert_difference('ClientHealthIssue.count', -1) do
      delete :destroy, :id => client_health_issues(:one).to_param
    end

    assert_redirected_to client_health_issues_path
  end
end
