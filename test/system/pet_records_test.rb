require "application_system_test_case"

class PetRecordsTest < ApplicationSystemTestCase
  setup do
    @pet_record = pet_records(:one)
  end

  test "visiting the index" do
    visit pet_records_url
    assert_selector "h1", text: "Pet Records"
  end

  test "creating a Pet record" do
    visit pet_records_url
    click_on "New Pet Record"

    fill_in "Content", with: @pet_record.content
    fill_in "Date", with: @pet_record.date
    fill_in "Pet", with: @pet_record.pet_id
    fill_in "Title", with: @pet_record.title
    click_on "Create Pet record"

    assert_text "Pet record was successfully created"
    click_on "Back"
  end

  test "updating a Pet record" do
    visit pet_records_url
    click_on "Edit", match: :first

    fill_in "Content", with: @pet_record.content
    fill_in "Date", with: @pet_record.date
    fill_in "Pet", with: @pet_record.pet_id
    fill_in "Title", with: @pet_record.title
    click_on "Update Pet record"

    assert_text "Pet record was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet record" do
    visit pet_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet record was successfully destroyed"
  end
end
