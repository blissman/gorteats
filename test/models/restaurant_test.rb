require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = FactoryGirl.create(:restaurant)
    @time = Time.now
    @reservation = FactoryGirl.create(:reservation)
  end

  test "restaurant is available" do
    assert @restaurant.available?(@reservation)
  end

  test "restaurant not available for party size 0" do
    reservation = FactoryGirl.create(:reservation, party_size: 0)
    assert_not @restaurant.available?(reservation)
  end

  test "restaurant not available for party size > capacity" do
    reservation = FactoryGirl.create(:reservation, party_size: 50)
    assert_not @restaurant.available?(reservation)
  end

  test "restaurant not available for multiple parties > capacity" do
    4.times do
      FactoryGirl.create(:reservation, restaurant: @restaurant)
    end
    assert_not @restaurant.available?(@reservation)
  end

  test "reservation cannot be a negative number" do
    reservation = FactoryGirl.create(:reservation, party_size: -5)
    assert_not @restaurant.available?(reservation)
  end

  # NOTE: This test cannot be written and proves logic should be in the model.
  # test "update reservation when full" do
  #   3.times do
  #     FactoryGirl.create(:reservation, restaurant: @restaurant)
  #   end
  #   reservation = FactoryGirl.create(:reservation, restaurant: @restaurant, party_size: 8)
  # end

end
