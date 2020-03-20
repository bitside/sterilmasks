require 'test_helper'

class ConsumersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumer = consumers(:one)
  end

  test "should get index" do
    get consumers_url
    assert_response :success
  end

  test "should get new" do
    get new_consumer_url
    assert_response :success
  end

  test "should create consumer" do
    assert_difference('Consumer.count') do
      post consumers_url, params: { consumer: { city: @consumer.city, description: @consumer.description, email: @consumer.email, name: @consumer.name, phone: @consumer.phone, postal_code: @consumer.postal_code, street: @consumer.street } }
    end

    assert_redirected_to consumer_url(Consumer.last)
  end

  test "should show consumer" do
    get consumer_url(@consumer)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumer_url(@consumer)
    assert_response :success
  end

  test "should update consumer" do
    patch consumer_url(@consumer), params: { consumer: { city: @consumer.city, description: @consumer.description, email: @consumer.email, name: @consumer.name, phone: @consumer.phone, postal_code: @consumer.postal_code, street: @consumer.street } }
    assert_redirected_to consumer_url(@consumer)
  end

  test "should destroy consumer" do
    assert_difference('Consumer.count', -1) do
      delete consumer_url(@consumer)
    end

    assert_redirected_to consumers_url
  end
end
