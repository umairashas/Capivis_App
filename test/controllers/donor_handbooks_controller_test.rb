require "test_helper"

class DonorHandbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donor_handbook = donor_handbooks(:one)
  end

  test "should get index" do
    get donor_handbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_donor_handbook_url
    assert_response :success
  end

  test "should create donor_handbook" do
    assert_difference("DonorHandbook.count") do
      post donor_handbooks_url, params: { donor_handbook: { description: @donor_handbook.description, status: @donor_handbook.status, title: @donor_handbook.title, user_id: @donor_handbook.user_id } }
    end

    assert_redirected_to donor_handbook_url(DonorHandbook.last)
  end

  test "should show donor_handbook" do
    get donor_handbook_url(@donor_handbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_donor_handbook_url(@donor_handbook)
    assert_response :success
  end

  test "should update donor_handbook" do
    patch donor_handbook_url(@donor_handbook), params: { donor_handbook: { description: @donor_handbook.description, status: @donor_handbook.status, title: @donor_handbook.title, user_id: @donor_handbook.user_id } }
    assert_redirected_to donor_handbook_url(@donor_handbook)
  end

  test "should destroy donor_handbook" do
    assert_difference("DonorHandbook.count", -1) do
      delete donor_handbook_url(@donor_handbook)
    end

    assert_redirected_to donor_handbooks_url
  end
end
