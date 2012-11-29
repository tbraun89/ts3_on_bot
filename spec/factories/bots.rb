FactoryGirl.define do
  factory :bot do
    sequence(:name) {|n| "bot_#{n}"}
  end
end