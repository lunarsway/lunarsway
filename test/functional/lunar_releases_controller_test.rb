require File.dirname(__FILE__) + '/../test_helper'

class LunarReleasesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:lunar_releases)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_lunar_release
    assert_difference('LunarRelease.count') do
      post :create, :lunar_release => { }
    end

    assert_redirected_to lunar_release_path(assigns(:lunar_release))
  end

  def test_should_show_lunar_release
    get :show, :id => lunar_releases(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => lunar_releases(:one).id
    assert_response :success
  end

  def test_should_update_lunar_release
    put :update, :id => lunar_releases(:one).id, :lunar_release => { }
    assert_redirected_to lunar_release_path(assigns(:lunar_release))
  end

  def test_should_destroy_lunar_release
    assert_difference('LunarRelease.count', -1) do
      delete :destroy, :id => lunar_releases(:one).id
    end

    assert_redirected_to lunar_releases_path
  end
end
