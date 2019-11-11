require 'test_helper'

class VetProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vet_profile = vet_profiles(:one)
  end

  test "should get index" do
    get vet_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_vet_profile_url
    assert_response :success
  end

  test "should create vet_profile" do
    assert_difference('VetProfile.count') do
      post vet_profiles_url, params: { vet_profile: { address: @vet_profile.address, clinic_name: @vet_profile.clinic_name, hours: @vet_profile.hours, image: @vet_profile.image, phone: @vet_profile.phone, postalcode: @vet_profile.postalcode, services: @vet_profile.services, vet_id: @vet_profile.vet_id } }
    end

    assert_redirected_to vet_profile_url(VetProfile.last)
  end

  test "should show vet_profile" do
    get vet_profile_url(@vet_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_vet_profile_url(@vet_profile)
    assert_response :success
  end

  test "should update vet_profile" do
    patch vet_profile_url(@vet_profile), params: { vet_profile: { address: @vet_profile.address, clinic_name: @vet_profile.clinic_name, hours: @vet_profile.hours, image: @vet_profile.image, phone: @vet_profile.phone, postalcode: @vet_profile.postalcode, services: @vet_profile.services, vet_id: @vet_profile.vet_id } }
    assert_redirected_to vet_profile_url(@vet_profile)
  end

  test "should destroy vet_profile" do
    assert_difference('VetProfile.count', -1) do
      delete vet_profile_url(@vet_profile)
    end

    assert_redirected_to vet_profiles_url
  end
end
