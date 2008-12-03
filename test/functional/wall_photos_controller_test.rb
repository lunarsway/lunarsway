require File.dirname(__FILE__) + '/../test_helper'

class WallPhotosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:wall_photos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_wall_photo
    assert_difference('WallPhoto.count') do
      post :create, :wall_photo => { }
    end

    assert_redirected_to wall_photo_path(assigns(:wall_photo))
  end

  def test_should_show_wall_photo
    get :show, :id => wall_photos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => wall_photos(:one).id
    assert_response :success
  end

  def test_should_update_wall_photo
    put :update, :id => wall_photos(:one).id, :wall_photo => { }
    assert_redirected_to wall_photo_path(assigns(:wall_photo))
  end

  def test_should_destroy_wall_photo
    assert_difference('WallPhoto.count', -1) do
      delete :destroy, :id => wall_photos(:one).id
    end

    assert_redirected_to wall_photos_path
  end
end
