require "test_helper"

class BioCredentialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bio_credential = bio_credentials(:one)
  end

  test "should get index" do
    get bio_credentials_url
    assert_response :success
  end

  test "should get new" do
    get new_bio_credential_url
    assert_response :success
  end

  test "should create bio_credential" do
    assert_difference("BioCredential.count") do
      post bio_credentials_url, params: { bio_credential: { bio: @bio_credential.bio, license_description: @bio_credential.license_description, license_effective_date: @bio_credential.license_effective_date, license_expire_date: @bio_credential.license_expire_date, license_number: @bio_credential.license_number, user_id: @bio_credential.user_id } }
    end

    assert_redirected_to bio_credential_url(BioCredential.last)
  end

  test "should show bio_credential" do
    get bio_credential_url(@bio_credential)
    assert_response :success
  end

  test "should get edit" do
    get edit_bio_credential_url(@bio_credential)
    assert_response :success
  end

  test "should update bio_credential" do
    patch bio_credential_url(@bio_credential), params: { bio_credential: { bio: @bio_credential.bio, license_description: @bio_credential.license_description, license_effective_date: @bio_credential.license_effective_date, license_expire_date: @bio_credential.license_expire_date, license_number: @bio_credential.license_number, user_id: @bio_credential.user_id } }
    assert_redirected_to bio_credential_url(@bio_credential)
  end

  test "should destroy bio_credential" do
    assert_difference("BioCredential.count", -1) do
      delete bio_credential_url(@bio_credential)
    end

    assert_redirected_to bio_credentials_url
  end
end
