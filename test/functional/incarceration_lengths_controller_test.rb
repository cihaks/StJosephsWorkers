require 'test_helper'

class IncarcerationLengthsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incarceration_lengths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incarceration_length" do
    assert_difference('IncarcerationLength.count') do
      post :create, :incarceration_length => { }
    end

    assert_redirected_to incarceration_length_path(assigns(:incarceration_length))
  end

  test "should show incarceration_length" do
    get :show, :id => incarceration_lengths(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => incarceration_lengths(:one).to_param
    assert_response :success
  end

  test "should update incarceration_length" do
    put :update, :id => incarceration_lengths(:one).to_param, :incarceration_length => { }
    assert_redirected_to incarceration_length_path(assigns(:incarceration_length))
  end

  test "should destroy incarceration_length" do
    assert_difference('IncarcerationLength.count', -1) do
      delete :destroy, :id => incarceration_lengths(:one).to_param
    end

    assert_redirected_to incarceration_lengths_path
  end
end
