require "application_system_test_case"

class DonorHandbooksTest < ApplicationSystemTestCase
  setup do
    @donor_handbook = donor_handbooks(:one)
  end

  test "visiting the index" do
    visit donor_handbooks_url
    assert_selector "h1", text: "Donor handbooks"
  end

  test "should create donor handbook" do
    visit donor_handbooks_url
    click_on "New donor handbook"

    fill_in "Description", with: @donor_handbook.description
    check "Status" if @donor_handbook.status
    fill_in "Title", with: @donor_handbook.title
    fill_in "User", with: @donor_handbook.user_id
    click_on "Create Donor handbook"

    assert_text "Donor handbook was successfully created"
    click_on "Back"
  end

  test "should update Donor handbook" do
    visit donor_handbook_url(@donor_handbook)
    click_on "Edit this donor handbook", match: :first

    fill_in "Description", with: @donor_handbook.description
    check "Status" if @donor_handbook.status
    fill_in "Title", with: @donor_handbook.title
    fill_in "User", with: @donor_handbook.user_id
    click_on "Update Donor handbook"

    assert_text "Donor handbook was successfully updated"
    click_on "Back"
  end

  test "should destroy Donor handbook" do
    visit donor_handbook_url(@donor_handbook)
    click_on "Destroy this donor handbook", match: :first

    assert_text "Donor handbook was successfully destroyed"
  end
end
