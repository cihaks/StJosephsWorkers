require 'test_helper'

class CrimeTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crime_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crime_type" do
    assert_difference('CrimeType.count') do
      post :create, :crime_type => { }
    end

    assert_redirected_to crime_type_path(assigns(:crime_type))
  end

  test "should show crime_type" do
    get :show, :id => crime_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => crime_types(:one).to_param
    assert_response :success
  end

  test "should update crime_type" do
    put :update, :id => crime_types(:one).to_param, :crime_type => { }
    assert_redirected_to crime_type_path(assigns(:crime_type))
  end

  test "should destroy crime_type" do
    assert_difference('CrimeType.count', -1) do
      delete :destroy, :id => crime_types(:one).to_param
    end

    assert_redirected_to crime_types_path
  end
end
