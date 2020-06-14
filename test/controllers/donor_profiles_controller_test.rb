require 'test_helper'

class DonorProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donor_profile = donor_profiles(:one)
  end

  test "should get index" do
    get donor_profiles_url, as: :json
    assert_response :success
  end

  test "should create donor_profile" do
    assert_difference('DonorProfile.count') do
      post donor_profiles_url, params: { donor_profile: { bloodType: @donor_profile.bloodType, is_available: @donor_profile.is_available, is_verified: @donor_profile.is_verified, latitude: @donor_profile.latitude, longitude: @donor_profile.longitude, user: @donor_profile.user, verification_code: @donor_profile.verification_code } }, as: :json
    end

    assert_response 201
  end

  test "should show donor_profile" do
    get donor_profile_url(@donor_profile), as: :json
    assert_response :success
  end

  test "should update donor_profile" do
    patch donor_profile_url(@donor_profile), params: { donor_profile: { bloodType: @donor_profile.bloodType, is_available: @donor_profile.is_available, is_verified: @donor_profile.is_verified, latitude: @donor_profile.latitude, longitude: @donor_profile.longitude, user: @donor_profile.user, verification_code: @donor_profile.verification_code } }, as: :json
    assert_response 200
  end

  test "should destroy donor_profile" do
    assert_difference('DonorProfile.count', -1) do
      delete donor_profile_url(@donor_profile), as: :json
    end

    assert_response 204
  end
end
