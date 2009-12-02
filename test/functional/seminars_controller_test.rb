require 'test_helper'

class SeminarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seminars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seminar" do
    assert_difference('Seminar.count') do
      post :create, :seminar => { }
    end

    assert_redirected_to seminar_path(assigns(:seminar))
  end

  test "should show seminar" do
    get :show, :id => seminars(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seminars(:one).to_param
    assert_response :success
  end

  test "should update seminar" do
    put :update, :id => seminars(:one).to_param, :seminar => { }
    assert_redirected_to seminar_path(assigns(:seminar))
  end

  test "should destroy seminar" do
    assert_difference('Seminar.count', -1) do
      delete :destroy, :id => seminars(:one).to_param
    end

    assert_redirected_to seminars_path
  end
end
