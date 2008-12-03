require File.dirname(__FILE__) + '/../test_helper'

class WallMessagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:wall_messages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_wall_message
    assert_difference('WallMessage.count') do
      post :create, :wall_message => { }
    end

    assert_redirected_to wall_message_path(assigns(:wall_message))
  end

  def test_should_show_wall_message
    get :show, :id => wall_messages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => wall_messages(:one).id
    assert_response :success
  end

  def test_should_update_wall_message
    put :update, :id => wall_messages(:one).id, :wall_message => { }
    assert_redirected_to wall_message_path(assigns(:wall_message))
  end

  def test_should_destroy_wall_message
    assert_difference('WallMessage.count', -1) do
      delete :destroy, :id => wall_messages(:one).id
    end

    assert_redirected_to wall_messages_path
  end
end
