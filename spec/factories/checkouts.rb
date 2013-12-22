# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkout do
    book_id 1
    due_date "2013-12-21 18:54:44"
  end
end
