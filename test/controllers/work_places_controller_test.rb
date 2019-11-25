require 'test_helper'

class WorkPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_place = work_places(:one)
  end

  test "should get index" do
    get work_places_url
    assert_response :success
  end

  test "should get new" do
    get new_work_place_url
    assert_response :success
  end

  test "should create work_place" do
    assert_difference('WorkPlace.count') do
      post work_places_url, params: { work_place: { image: @work_place.image, name: @work_place.name, region: @work_place.region, tel: @work_place.tel, url: @work_place.url, user_id: @work_place.user_id } }
    end

    assert_redirected_to work_place_url(WorkPlace.last)
  end

  test "should show work_place" do
    get work_place_url(@work_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_place_url(@work_place)
    assert_response :success
  end

  test "should update work_place" do
    patch work_place_url(@work_place), params: { work_place: { image: @work_place.image, name: @work_place.name, region: @work_place.region, tel: @work_place.tel, url: @work_place.url, user_id: @work_place.user_id } }
    assert_redirected_to work_place_url(@work_place)
  end

  test "should destroy work_place" do
    assert_difference('WorkPlace.count', -1) do
      delete work_place_url(@work_place)
    end

    assert_redirected_to work_places_url
  end
end
