require 'test_helper'

class PetRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_record = pet_records(:one)
  end

  test "should get index" do
    get pet_records_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_record_url
    assert_response :success
  end

  test "should create pet_record" do
    assert_difference('PetRecord.count') do
      post pet_records_url, params: { pet_record: { content: @pet_record.content, date: @pet_record.date, pet_id: @pet_record.pet_id, title: @pet_record.title } }
    end

    assert_redirected_to pet_record_url(PetRecord.last)
  end

  test "should show pet_record" do
    get pet_record_url(@pet_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_record_url(@pet_record)
    assert_response :success
  end

  test "should update pet_record" do
    patch pet_record_url(@pet_record), params: { pet_record: { content: @pet_record.content, date: @pet_record.date, pet_id: @pet_record.pet_id, title: @pet_record.title } }
    assert_redirected_to pet_record_url(@pet_record)
  end

  test "should destroy pet_record" do
    assert_difference('PetRecord.count', -1) do
      delete pet_record_url(@pet_record)
    end

    assert_redirected_to pet_records_url
  end
end
