FactoryGirl.define do
  factory :user do
    username "user"
    password "useruser"
    email    "user@example.com"
    admin    false
  end

  factory :admin, class: User do
    username "admin"
    password "adminadmin"
    email    "admin@example.com"
    admin    true
  end
end