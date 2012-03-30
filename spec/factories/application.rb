FactoryGirl.define do
  factory :application, :class => Doorkeeper::Application do
    sequence(:name){ |n| "Application #{n}" }
    sequence(:resource_owner_id){ |n| n }
    redirect_uri "https://app.com/callback"
  end
end
