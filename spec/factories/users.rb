FactoryBot.define do
  factory :user do
    username { FFaker::Name.first_name }
    email {FFaker::Internet::email}
    password '123456'

    factory :expert, class: 'Expert', parent: :user do
      type 'Expert'
    end

    factory :novice, class: 'Novice', parent: :user do
      type 'Novice'
    end
  end
end
