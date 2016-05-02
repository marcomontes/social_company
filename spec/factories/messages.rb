FactoryGirl.define do
  factory :message do
    user_id 1
    category_id_integer "MyString"
    visibility 1
    group_ids "MyText"
    body "MyText"
  end
end
