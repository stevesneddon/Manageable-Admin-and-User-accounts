FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :admin do
    name     "Steve Sneddon"
    email    "sned2g@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
