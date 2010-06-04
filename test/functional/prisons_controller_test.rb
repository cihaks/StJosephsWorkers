require 'test_helper'

class PrisonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prisons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prison" do
    assert_difference('Prison.count') do
      post :create, :prison => { }
    end

    assert_redirected_to prison_path(assigns(:prison))
  end

  test "should show prison" do
    get :show, :id => prisons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prisons(:one).to_param
    assert_response :success
  end

  test "should update prison" do
    put :update, :id => prisons(:one).to_param, :prison => { }
    assert_redirected_to prison_path(assigns(:prison))
  end

  test "should destroy prison" do
    assert_difference('Prison.count', -1) do
      delete :destroy, :id => prisons(:one).to_param
    end

    assert_redirected_to prisons_path
  end
end
