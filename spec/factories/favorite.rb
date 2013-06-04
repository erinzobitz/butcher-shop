FactoryGirl.define do
  factory :favorite do
  	association :user
  	association :cut
  end
end
