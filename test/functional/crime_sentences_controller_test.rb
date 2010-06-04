require 'test_helper'

class CrimeSentencesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crime_sentences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crime_sentence" do
    assert_difference('CrimeSentence.count') do
      post :create, :crime_sentence => { }
    end

    assert_redirected_to crime_sentence_path(assigns(:crime_sentence))
  end

  test "should show crime_sentence" do
    get :show, :id => crime_sentences(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => crime_sentences(:one).to_param
    assert_response :success
  end

  test "should update crime_sentence" do
    put :update, :id => crime_sentences(:one).to_param, :crime_sentence => { }
    assert_redirected_to crime_sentence_path(assigns(:crime_sentence))
  end

  test "should destroy crime_sentence" do
    assert_difference('CrimeSentence.count', -1) do
      delete :destroy, :id => crime_sentences(:one).to_param
    end

    assert_redirected_to crime_sentences_path
  end
end
