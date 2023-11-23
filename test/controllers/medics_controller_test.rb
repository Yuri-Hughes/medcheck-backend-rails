require "test_helper"

class MedicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medic = medics(:one)
  end

  test "should get index" do
    get medics_url, as: :json
    assert_response :success
  end

  test "should create medic" do
    assert_difference("Medic.count") do
      post medics_url, params: { medic: { registry: @medic.registry, specialty_id: @medic.specialty_id, uid: @medic.id } }, as: :json
    end

    assert_response :created
  end

  test "should show medic" do
    get medic_url(@medic), as: :json
    assert_response :success
  end

  test "should update medic" do
    patch medic_url(@medic), params: { medic: { registry: @medic.registry, specialty_id: @medic.specialty_id, id: @medic.id } }, as: :json
    assert_response :success
  end

  test "should destroy medic" do
    assert_difference("Medic.count", -1) do
      delete medic_url(@medic), as: :json
    end

    assert_response :no_content
  end
end
