FactoryBot.define do
  factory :notification do
    visitor { nil }
    visited { nil }
    item { nil }
    comment { nil }
    room { nil }
    message { nil }
    action { "MyString" }
    checked { false }
  end
end
