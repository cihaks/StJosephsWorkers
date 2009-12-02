require 'test_helper'

class ClientHealthIssueMedicinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_health_issue_medicines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_health_issue_medicine" do
    assert_difference('ClientHealthIssueMedicine.count') do
      post :create, :client_health_issue_medicine => { }
    end

    assert_redirected_to client_health_issue_medicine_path(assigns(:client_health_issue_medicine))
  end

  test "should show client_health_issue_medicine" do
    get :show, :id => client_health_issue_medicines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_health_issue_medicines(:one).to_param
    assert_response :success
  end

  test "should update client_health_issue_medicine" do
    put :update, :id => client_health_issue_medicines(:one).to_param, :client_health_issue_medicine => { }
    assert_redirected_to client_health_issue_medicine_path(assigns(:client_health_issue_medicine))
  end

  test "should destroy client_health_issue_medicine" do
    assert_difference('ClientHealthIssueMedicine.count', -1) do
      delete :destroy, :id => client_health_issue_medicines(:one).to_param
    end

    assert_redirected_to client_health_issue_medicines_path
  end
end
