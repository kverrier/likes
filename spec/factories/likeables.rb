# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :likeable, :class => 'Likeables' do
    name "Something I Like"
  end
end
