require 'test_helper'

class ClientContactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_contact" do
    assert_difference('ClientContact.count') do
      post :create, :client_contact => { }
    end

    assert_redirected_to client_contact_path(assigns(:client_contact))
  end

  test "should show client_contact" do
    get :show, :id => client_contacts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_contacts(:one).to_param
    assert_response :success
  end

  test "should update client_contact" do
    put :update, :id => client_contacts(:one).to_param, :client_contact => { }
    assert_redirected_to client_contact_path(assigns(:client_contact))
  end

  test "should destroy client_contact" do
    assert_difference('ClientContact.count', -1) do
      delete :destroy, :id => client_contacts(:one).to_param
    end

    assert_redirected_to client_contacts_path
  end
end
