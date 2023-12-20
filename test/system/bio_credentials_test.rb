require "application_system_test_case"

class BioCredentialsTest < ApplicationSystemTestCase
  setup do
    @bio_credential = bio_credentials(:one)
  end

  test "visiting the index" do
    visit bio_credentials_url
    assert_selector "h1", text: "Bio credentials"
  end

  test "should create bio credential" do
    visit bio_credentials_url
    click_on "New bio credential"

    fill_in "Bio", with: @bio_credential.bio
    fill_in "License description", with: @bio_credential.license_description
    fill_in "License effective date", with: @bio_credential.license_effective_date
    fill_in "License expire date", with: @bio_credential.license_expire_date
    fill_in "License number", with: @bio_credential.license_number
    fill_in "User", with: @bio_credential.user_id
    click_on "Create Bio credential"

    assert_text "Bio credential was successfully created"
    click_on "Back"
  end

  test "should update Bio credential" do
    visit bio_credential_url(@bio_credential)
    click_on "Edit this bio credential", match: :first

    fill_in "Bio", with: @bio_credential.bio
    fill_in "License description", with: @bio_credential.license_description
    fill_in "License effective date", with: @bio_credential.license_effective_date
    fill_in "License expire date", with: @bio_credential.license_expire_date
    fill_in "License number", with: @bio_credential.license_number
    fill_in "User", with: @bio_credential.user_id
    click_on "Update Bio credential"

    assert_text "Bio credential was successfully updated"
    click_on "Back"
  end

  test "should destroy Bio credential" do
    visit bio_credential_url(@bio_credential)
    click_on "Destroy this bio credential", match: :first

    assert_text "Bio credential was successfully destroyed"
  end
end
