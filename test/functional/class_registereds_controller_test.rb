require 'test_helper'

class ClassRegisteredsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_registereds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_registered" do
    assert_difference('ClassRegistered.count') do
      post :create, :class_registered => { }
    end

    assert_redirected_to class_registered_path(assigns(:class_registered))
  end

  test "should show class_registered" do
    get :show, :id => class_registereds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => class_registereds(:one).to_param
    assert_response :success
  end

  test "should update class_registered" do
    put :update, :id => class_registereds(:one).to_param, :class_registered => { }
    assert_redirected_to class_registered_path(assigns(:class_registered))
  end

  test "should destroy class_registered" do
    assert_difference('ClassRegistered.count', -1) do
      delete :destroy, :id => class_registereds(:one).to_param
    end

    assert_redirected_to class_registereds_path
  end
end
