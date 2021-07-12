require "application_system_test_case"

class BookingInfosTest < ApplicationSystemTestCase
  setup do
    @booking_info = booking_infos(:one)
  end

  test "visiting the index" do
    visit booking_infos_url
    assert_selector "h1", text: "Booking Infos"
  end

  test "creating a Booking info" do
    visit booking_infos_url
    click_on "New Booking Info"

    fill_in "Coordination preference", with: @booking_info.coordination_preference
    fill_in "Group count", with: @booking_info.group_count
    fill_in "Hotel type", with: @booking_info.hotel_type
    fill_in "Othernames", with: @booking_info.othernames
    fill_in "Phone number", with: @booking_info.phone_number
    fill_in "Purpose statement", with: @booking_info.purpose_statement
    fill_in "Surname", with: @booking_info.surname
    fill_in "Tour duration", with: @booking_info.tour_duration
    click_on "Create Booking info"

    assert_text "Booking info was successfully created"
    click_on "Back"
  end

  test "updating a Booking info" do
    visit booking_infos_url
    click_on "Edit", match: :first

    fill_in "Coordination preference", with: @booking_info.coordination_preference
    fill_in "Group count", with: @booking_info.group_count
    fill_in "Hotel type", with: @booking_info.hotel_type
    fill_in "Othernames", with: @booking_info.othernames
    fill_in "Phone number", with: @booking_info.phone_number
    fill_in "Purpose statement", with: @booking_info.purpose_statement
    fill_in "Surname", with: @booking_info.surname
    fill_in "Tour duration", with: @booking_info.tour_duration
    click_on "Update Booking info"

    assert_text "Booking info was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking info" do
    visit booking_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking info was successfully destroyed"
  end
end
