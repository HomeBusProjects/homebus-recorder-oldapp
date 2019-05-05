require "application_system_test_case"

class CreateDeviceTablesTest < ApplicationSystemTestCase
  setup do
    @create_device_table = create_device_tables(:one)
  end

  test "visiting the index" do
    visit create_device_tables_url
    assert_selector "h1", text: "Create Device Tables"
  end

  test "creating a Create device table" do
    visit create_device_tables_url
    click_on "New Create Device Table"

    fill_in "Api Key", with: @create_device_table.api_key
    fill_in "City", with: @create_device_table.city
    fill_in "Latitude", with: @create_device_table.latitude
    fill_in "Longitude", with: @create_device_table.longitude
    fill_in "Nickname", with: @create_device_table.nickname
    fill_in "Postal Code", with: @create_device_table.postal_code
    fill_in "State", with: @create_device_table.state
    fill_in "Street Address", with: @create_device_table.street_address
    click_on "Create Create device table"

    assert_text "Create device table was successfully created"
    click_on "Back"
  end

  test "updating a Create device table" do
    visit create_device_tables_url
    click_on "Edit", match: :first

    fill_in "Api Key", with: @create_device_table.api_key
    fill_in "City", with: @create_device_table.city
    fill_in "Latitude", with: @create_device_table.latitude
    fill_in "Longitude", with: @create_device_table.longitude
    fill_in "Nickname", with: @create_device_table.nickname
    fill_in "Postal Code", with: @create_device_table.postal_code
    fill_in "State", with: @create_device_table.state
    fill_in "Street Address", with: @create_device_table.street_address
    click_on "Update Create device table"

    assert_text "Create device table was successfully updated"
    click_on "Back"
  end

  test "destroying a Create device table" do
    visit create_device_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create device table was successfully destroyed"
  end
end
