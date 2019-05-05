require 'test_helper'

class CreateDeviceTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_device_table = create_device_tables(:one)
  end

  test "should get index" do
    get create_device_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_create_device_table_url
    assert_response :success
  end

  test "should create create_device_table" do
    assert_difference('CreateDeviceTable.count') do
      post create_device_tables_url, params: { create_device_table: { api_key: @create_device_table.api_key, city: @create_device_table.city, latitude: @create_device_table.latitude, longitude: @create_device_table.longitude, nickname: @create_device_table.nickname, postal_code: @create_device_table.postal_code, state: @create_device_table.state, street_address: @create_device_table.street_address } }
    end

    assert_redirected_to create_device_table_url(CreateDeviceTable.last)
  end

  test "should show create_device_table" do
    get create_device_table_url(@create_device_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_device_table_url(@create_device_table)
    assert_response :success
  end

  test "should update create_device_table" do
    patch create_device_table_url(@create_device_table), params: { create_device_table: { api_key: @create_device_table.api_key, city: @create_device_table.city, latitude: @create_device_table.latitude, longitude: @create_device_table.longitude, nickname: @create_device_table.nickname, postal_code: @create_device_table.postal_code, state: @create_device_table.state, street_address: @create_device_table.street_address } }
    assert_redirected_to create_device_table_url(@create_device_table)
  end

  test "should destroy create_device_table" do
    assert_difference('CreateDeviceTable.count', -1) do
      delete create_device_table_url(@create_device_table)
    end

    assert_redirected_to create_device_tables_url
  end
end
