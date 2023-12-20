require "application_system_test_case"

class InstructorsTest < ApplicationSystemTestCase
  setup do
    @instructor = instructors(:one)
  end

  test "visiting the index" do
    visit instructors_url
    assert_selector "h1", text: "Instructors"
  end

  test "should create instructor" do
    visit instructors_url
    click_on "New instructor"

    fill_in "Bio", with: @instructor.bio
    fill_in "License expiration", with: @instructor.license_expiration
    fill_in "License name", with: @instructor.license_name
    fill_in "Photo", with: @instructor.photo
    fill_in "User", with: @instructor.user_id
    click_on "Create Instructor"

    assert_text "Instructor was successfully created"
    click_on "Back"
  end

  test "should update Instructor" do
    visit instructor_url(@instructor)
    click_on "Edit this instructor", match: :first

    fill_in "Bio", with: @instructor.bio
    fill_in "License expiration", with: @instructor.license_expiration
    fill_in "License name", with: @instructor.license_name
    fill_in "Photo", with: @instructor.photo
    fill_in "User", with: @instructor.user_id
    click_on "Update Instructor"

    assert_text "Instructor was successfully updated"
    click_on "Back"
  end

  test "should destroy Instructor" do
    visit instructor_url(@instructor)
    click_on "Destroy this instructor", match: :first

    assert_text "Instructor was successfully destroyed"
  end
end
