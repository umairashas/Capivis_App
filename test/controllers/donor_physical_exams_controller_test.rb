require "test_helper"

class DonorPhysicalExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donor_physical_exams_index_url
    assert_response :success
  end

  test "should get show" do
    get donor_physical_exams_show_url
    assert_response :success
  end

  test "should get new" do
    get donor_physical_exams_new_url
    assert_response :success
  end

  test "should get edit" do
    get donor_physical_exams_edit_url
    assert_response :success
  end
end
