require 'test_helper'

class AssignaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignatures_index_url
    assert_response :success
  end

  test "should get show" do
    get assignatures_show_url
    assert_response :success
  end

  test "should get new" do
    get assignatures_new_url
    assert_response :success
  end

  test "should get edit" do
    get assignatures_edit_url
    assert_response :success
  end

  test "should get create" do
    get assignatures_create_url
    assert_response :success
  end

  test "should get update" do
    get assignatures_update_url
    assert_response :success
  end

  test "should get destroy" do
    get assignatures_destroy_url
    assert_response :success
  end

end
