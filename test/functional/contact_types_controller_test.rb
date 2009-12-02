require 'test_helper'

class ContactTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_type" do
    assert_difference('ContactType.count') do
      post :create, :contact_type => { }
    end

    assert_redirected_to contact_type_path(assigns(:contact_type))
  end

  test "should show contact_type" do
    get :show, :id => contact_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_types(:one).to_param
    assert_response :success
  end

  test "should update contact_type" do
    put :update, :id => contact_types(:one).to_param, :contact_type => { }
    assert_redirected_to contact_type_path(assigns(:contact_type))
  end

  test "should destroy contact_type" do
    assert_difference('ContactType.count', -1) do
      delete :destroy, :id => contact_types(:one).to_param
    end

    assert_redirected_to contact_types_path
  end
end
