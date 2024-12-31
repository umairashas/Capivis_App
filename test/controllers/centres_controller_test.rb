require "test_helper"

class CentresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get centres_index_url
    assert_response :success
  end

  test "should get new" do
    get centres_new_url
    assert_response :success
  end

  test "should get create" do
    get centres_create_url
    assert_response :success
  end
end
