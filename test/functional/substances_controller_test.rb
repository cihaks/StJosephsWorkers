require 'test_helper'

class SubstancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:substances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create substance" do
    assert_difference('Substance.count') do
      post :create, :substance => { }
    end

    assert_redirected_to substance_path(assigns(:substance))
  end

  test "should show substance" do
    get :show, :id => substances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => substances(:one).to_param
    assert_response :success
  end

  test "should update substance" do
    put :update, :id => substances(:one).to_param, :substance => { }
    assert_redirected_to substance_path(assigns(:substance))
  end

  test "should destroy substance" do
    assert_difference('Substance.count', -1) do
      delete :destroy, :id => substances(:one).to_param
    end

    assert_redirected_to substances_path
  end
end
