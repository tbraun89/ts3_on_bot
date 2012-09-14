FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user_#{n}"}
    password "useruser"
    sequence(:email) {|n| "user_#{n}@example.com"}
    admin    false
  end

  factory :admin, class: User do
    sequence(:username) {|n| "adnim_#{n}"}
    password "adminadmin"
    sequence(:email) {|n| "admin_#{n}@example.com"}
    admin    true
  end
end