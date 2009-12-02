require 'test_helper'

class ClientContactNotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_contact_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_contact_note" do
    assert_difference('ClientContactNote.count') do
      post :create, :client_contact_note => { }
    end

    assert_redirected_to client_contact_note_path(assigns(:client_contact_note))
  end

  test "should show client_contact_note" do
    get :show, :id => client_contact_notes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_contact_notes(:one).to_param
    assert_response :success
  end

  test "should update client_contact_note" do
    put :update, :id => client_contact_notes(:one).to_param, :client_contact_note => { }
    assert_redirected_to client_contact_note_path(assigns(:client_contact_note))
  end

  test "should destroy client_contact_note" do
    assert_difference('ClientContactNote.count', -1) do
      delete :destroy, :id => client_contact_notes(:one).to_param
    end

    assert_redirected_to client_contact_notes_path
  end
end
