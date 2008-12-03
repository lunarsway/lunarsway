require File.dirname(__FILE__) + '/../test_helper'

class ProfilePhotosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_photos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_profile_photo
    assert_difference('ProfilePhoto.count') do
      post :create, :profile_photo => { }
    end

    assert_redirected_to profile_photo_path(assigns(:profile_photo))
  end

  def test_should_show_profile_photo
    get :show, :id => profile_photos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => profile_photos(:one).id
    assert_response :success
  end

  def test_should_update_profile_photo
    put :update, :id => profile_photos(:one).id, :profile_photo => { }
    assert_redirected_to profile_photo_path(assigns(:profile_photo))
  end

  def test_should_destroy_profile_photo
    assert_difference('ProfilePhoto.count', -1) do
      delete :destroy, :id => profile_photos(:one).id
    end

    assert_redirected_to profile_photos_path
  end
end
