require "application_system_test_case"

class VetProfilesTest < ApplicationSystemTestCase
  setup do
    @vet_profile = vet_profiles(:one)
  end

  test "visiting the index" do
    visit vet_profiles_url
    assert_selector "h1", text: "Vet Profiles"
  end

  test "creating a Vet profile" do
    visit vet_profiles_url
    click_on "New Vet Profile"

    fill_in "Address", with: @vet_profile.address
    fill_in "Clinic name", with: @vet_profile.clinic_name
    fill_in "Hours", with: @vet_profile.hours
    fill_in "Image", with: @vet_profile.image
    fill_in "Phone", with: @vet_profile.phone
    fill_in "Postalcode", with: @vet_profile.postalcode
    fill_in "Services", with: @vet_profile.services
    fill_in "Vet", with: @vet_profile.vet_id
    click_on "Create Vet profile"

    assert_text "Vet profile was successfully created"
    click_on "Back"
  end

  test "updating a Vet profile" do
    visit vet_profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @vet_profile.address
    fill_in "Clinic name", with: @vet_profile.clinic_name
    fill_in "Hours", with: @vet_profile.hours
    fill_in "Image", with: @vet_profile.image
    fill_in "Phone", with: @vet_profile.phone
    fill_in "Postalcode", with: @vet_profile.postalcode
    fill_in "Services", with: @vet_profile.services
    fill_in "Vet", with: @vet_profile.vet_id
    click_on "Update Vet profile"

    assert_text "Vet profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Vet profile" do
    visit vet_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vet profile was successfully destroyed"
  end
end
