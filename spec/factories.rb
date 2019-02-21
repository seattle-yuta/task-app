FactoryBot.define do
  factory :user do
    sequence(:name) { "sample"}
    sequence(:mail) { "sample@example.com"}
    sequence(:password_digest) { "aaaaaa" }
    sequence(:remember_token) { "bbbbbb" }
  end

  factory :user_project do
    sequence(:user_id) { 1 }
    sequence(:project_id) { 1 }
  end

  factory :project do
    sequence(:name) { "sample_project"}
    sequence(:display_order) { 1 }
  end

  factory :check_list do
    sequence(:name) { "sample_check_list"}
    sequence(:display_order) { 1 }
    sequence(:display_flag) { true }
    sequence(:card_id) { 1 }
    sequence(:user_id) { 1 }
    card
  end

  factory :check_item do
    sequence(:name) { "sample_check_item"}
    sequence(:display_order) { 1 }
    sequence(:achievement_flag) { true }
    check_list
  end

  factory :card do
    sequence(:name) { "sample_card"}
    sequence(:display_order) { 1 }
    sequence(:detail) { "aaaaa" }
    sequence(:start_deadline) { "2019-02-21 00:00:00" }
    sequence(:end_deadline) { "2019-02-21 00:00:00" }
    board_list
  end

  factory :board_list do
    sequence(:name) { "sample_board_list"}
    sequence(:display_order) { 1 }
    project
  end

end