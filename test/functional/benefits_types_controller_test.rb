require 'test_helper'

class BenefitsTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benefits_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benefits_type" do
    assert_difference('BenefitsType.count') do
      post :create, :benefits_type => { }
    end

    assert_redirected_to benefits_type_path(assigns(:benefits_type))
  end

  test "should show benefits_type" do
    get :show, :id => benefits_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => benefits_types(:one).to_param
    assert_response :success
  end

  test "should update benefits_type" do
    put :update, :id => benefits_types(:one).to_param, :benefits_type => { }
    assert_redirected_to benefits_type_path(assigns(:benefits_type))
  end

  test "should destroy benefits_type" do
    assert_difference('BenefitsType.count', -1) do
      delete :destroy, :id => benefits_types(:one).to_param
    end

    assert_redirected_to benefits_types_path
  end
end
