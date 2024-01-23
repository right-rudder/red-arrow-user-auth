require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "should create document" do
    visit documents_url
    click_on "New document"

    fill_in "Description", with: @document.description
    check "Hide" if @document.hide
    check "Is dispatcher" if @document.is_dispatcher
    check "Is frontoffice" if @document.is_frontoffice
    check "Is guest" if @document.is_guest
    check "Is instructor" if @document.is_instructor
    check "Is maintenance" if @document.is_maintenance
    check "Is student" if @document.is_student
    fill_in "Location", with: @document.location
    fill_in "Name", with: @document.name
    click_on "Create Document"

    assert_text "Document was successfully created"
    click_on "Back"
  end

  test "should update Document" do
    visit document_url(@document)
    click_on "Edit this document", match: :first

    fill_in "Description", with: @document.description
    check "Hide" if @document.hide
    check "Is dispatcher" if @document.is_dispatcher
    check "Is frontoffice" if @document.is_frontoffice
    check "Is guest" if @document.is_guest
    check "Is instructor" if @document.is_instructor
    check "Is maintenance" if @document.is_maintenance
    check "Is student" if @document.is_student
    fill_in "Location", with: @document.location
    fill_in "Name", with: @document.name
    click_on "Update Document"

    assert_text "Document was successfully updated"
    click_on "Back"
  end

  test "should destroy Document" do
    visit document_url(@document)
    click_on "Destroy this document", match: :first

    assert_text "Document was successfully destroyed"
  end
end
