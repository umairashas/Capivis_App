require "test_helper"

class DonorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donors_index_url
    assert_response :success
  end

  test "should get show" do
    get donors_show_url
    assert_response :success
  end

  test "should get new" do
    get donors_new_url
    assert_response :success
  end

  test "should get edit" do
    get donors_edit_url
    assert_response :success
  end
end
