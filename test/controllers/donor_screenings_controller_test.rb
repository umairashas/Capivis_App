require "test_helper"

class DonorScreeningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donor_screenings_index_url
    assert_response :success
  end

  test "should get new" do
    get donor_screenings_new_url
    assert_response :success
  end

  test "should get show" do
    get donor_screenings_show_url
    assert_response :success
  end
end
