require 'test_helper'

class DedicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dedication = dedications(:one)
  end

  test "should get index" do
    get dedications_url
    assert_response :success
  end

  test "should get new" do
    get new_dedication_url
    assert_response :success
  end

  test "should create dedication" do
    assert_difference('Dedication.count') do
      post dedications_url, params: { dedication: { hours: @dedication.hours, name: @dedication.name } }
    end

    assert_redirected_to dedication_url(Dedication.last)
  end

  test "should show dedication" do
    get dedication_url(@dedication)
    assert_response :success
  end

  test "should get edit" do
    get edit_dedication_url(@dedication)
    assert_response :success
  end

  test "should update dedication" do
    patch dedication_url(@dedication), params: { dedication: { hours: @dedication.hours, name: @dedication.name } }
    assert_redirected_to dedication_url(@dedication)
  end

  test "should destroy dedication" do
    assert_difference('Dedication.count', -1) do
      delete dedication_url(@dedication)
    end

    assert_redirected_to dedications_url
  end
end
