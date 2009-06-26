require File.dirname(__FILE__) + '/../test_helper'

class YouTubeVideosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:you_tube_videos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_you_tube_video
    assert_difference('YouTubeVideo.count') do
      post :create, :you_tube_video => { }
    end

    assert_redirected_to you_tube_video_path(assigns(:you_tube_video))
  end

  def test_should_show_you_tube_video
    get :show, :id => you_tube_videos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => you_tube_videos(:one).id
    assert_response :success
  end

  def test_should_update_you_tube_video
    put :update, :id => you_tube_videos(:one).id, :you_tube_video => { }
    assert_redirected_to you_tube_video_path(assigns(:you_tube_video))
  end

  def test_should_destroy_you_tube_video
    assert_difference('YouTubeVideo.count', -1) do
      delete :destroy, :id => you_tube_videos(:one).id
    end

    assert_redirected_to you_tube_videos_path
  end
end
