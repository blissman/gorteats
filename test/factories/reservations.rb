FactoryGirl.define do
  factory :reservation do
    date_time { Time.now }
    party_size 10
  end
end
