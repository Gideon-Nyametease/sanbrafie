require "test_helper"

class BookingInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_info = booking_infos(:one)
  end

  test "should get index" do
    get booking_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_info_url
    assert_response :success
  end

  test "should create booking_info" do
    assert_difference('BookingInfo.count') do
      post booking_infos_url, params: { booking_info: { coordination_preference: @booking_info.coordination_preference, group_count: @booking_info.group_count, hotel_type: @booking_info.hotel_type, othernames: @booking_info.othernames, phone_number: @booking_info.phone_number, purpose_statement: @booking_info.purpose_statement, surname: @booking_info.surname, tour_duration: @booking_info.tour_duration } }
    end

    assert_redirected_to booking_info_url(BookingInfo.last)
  end

  test "should show booking_info" do
    get booking_info_url(@booking_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_info_url(@booking_info)
    assert_response :success
  end

  test "should update booking_info" do
    patch booking_info_url(@booking_info), params: { booking_info: { coordination_preference: @booking_info.coordination_preference, group_count: @booking_info.group_count, hotel_type: @booking_info.hotel_type, othernames: @booking_info.othernames, phone_number: @booking_info.phone_number, purpose_statement: @booking_info.purpose_statement, surname: @booking_info.surname, tour_duration: @booking_info.tour_duration } }
    assert_redirected_to booking_info_url(@booking_info)
  end

  test "should destroy booking_info" do
    assert_difference('BookingInfo.count', -1) do
      delete booking_info_url(@booking_info)
    end

    assert_redirected_to booking_infos_url
  end
end
