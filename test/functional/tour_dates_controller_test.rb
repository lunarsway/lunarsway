require File.dirname(__FILE__) + '/../test_helper'

class TourDatesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_dates)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tour_date
    assert_difference('TourDate.count') do
      post :create, :tour_date => { }
    end

    assert_redirected_to tour_date_path(assigns(:tour_date))
  end

  def test_should_show_tour_date
    get :show, :id => tour_dates(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tour_dates(:one).id
    assert_response :success
  end

  def test_should_update_tour_date
    put :update, :id => tour_dates(:one).id, :tour_date => { }
    assert_redirected_to tour_date_path(assigns(:tour_date))
  end

  def test_should_destroy_tour_date
    assert_difference('TourDate.count', -1) do
      delete :destroy, :id => tour_dates(:one).id
    end

    assert_redirected_to tour_dates_path
  end
end
