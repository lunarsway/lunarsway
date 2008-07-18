require File.dirname(__FILE__) + '/../test_helper'

class MailingListItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:mailing_list_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_mailing_list_item
    assert_difference('MailingListItem.count') do
      post :create, :mailing_list_item => { }
    end

    assert_redirected_to mailing_list_item_path(assigns(:mailing_list_item))
  end

  def test_should_show_mailing_list_item
    get :show, :id => mailing_list_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => mailing_list_items(:one).id
    assert_response :success
  end

  def test_should_update_mailing_list_item
    put :update, :id => mailing_list_items(:one).id, :mailing_list_item => { }
    assert_redirected_to mailing_list_item_path(assigns(:mailing_list_item))
  end

  def test_should_destroy_mailing_list_item
    assert_difference('MailingListItem.count', -1) do
      delete :destroy, :id => mailing_list_items(:one).id
    end

    assert_redirected_to mailing_list_items_path
  end
end
