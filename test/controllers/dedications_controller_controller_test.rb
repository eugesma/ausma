require 'test_helper'

class DedicationsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dedications_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get dedications_controller_show_url
    assert_response :success
  end

  test "should get new" do
    get dedications_controller_new_url
    assert_response :success
  end

  test "should get edit" do
    get dedications_controller_edit_url
    assert_response :success
  end

  test "should get create" do
    get dedications_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get dedications_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dedications_controller_destroy_url
    assert_response :success
  end

end
