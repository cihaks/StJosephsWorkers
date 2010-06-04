require 'test_helper'

class ConvictionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:convictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conviction" do
    assert_difference('Conviction.count') do
      post :create, :conviction => { }
    end

    assert_redirected_to conviction_path(assigns(:conviction))
  end

  test "should show conviction" do
    get :show, :id => convictions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => convictions(:one).to_param
    assert_response :success
  end

  test "should update conviction" do
    put :update, :id => convictions(:one).to_param, :conviction => { }
    assert_redirected_to conviction_path(assigns(:conviction))
  end

  test "should destroy conviction" do
    assert_difference('Conviction.count', -1) do
      delete :destroy, :id => convictions(:one).to_param
    end

    assert_redirected_to convictions_path
  end
end
