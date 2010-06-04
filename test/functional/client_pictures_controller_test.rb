require 'test_helper'

class ClientPicturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_picture" do
    assert_difference('ClientPicture.count') do
      post :create, :client_picture => { }
    end

    assert_redirected_to client_picture_path(assigns(:client_picture))
  end

  test "should show client_picture" do
    get :show, :id => client_pictures(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => client_pictures(:one).to_param
    assert_response :success
  end

  test "should update client_picture" do
    put :update, :id => client_pictures(:one).to_param, :client_picture => { }
    assert_redirected_to client_picture_path(assigns(:client_picture))
  end

  test "should destroy client_picture" do
    assert_difference('ClientPicture.count', -1) do
      delete :destroy, :id => client_pictures(:one).to_param
    end

    assert_redirected_to client_pictures_path
  end
end
