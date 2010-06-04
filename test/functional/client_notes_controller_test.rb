require 'test_helper'

class ClientNotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_note" do
    assert_difference('ClientNote.count') do
      post :create, :client_note => { }
    end

    assert_redirected_to client_note_path(assigns(:client_note))
  end

  test "should show client_note" do
    get :show, :id => client_notes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_notes(:one).to_param
    assert_response :success
  end

  test "should update client_note" do
    put :update, :id => client_notes(:one).to_param, :client_note => { }
    assert_redirected_to client_note_path(assigns(:client_note))
  end

  test "should destroy client_note" do
    assert_difference('ClientNote.count', -1) do
      delete :destroy, :id => client_notes(:one).to_param
    end

    assert_redirected_to client_notes_path
  end
end
