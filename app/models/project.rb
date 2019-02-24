class Project < ApplicationRecord
    has_many :board_lists, dependent: :delete_all
    has_many :user_projects, dependent: :delete_all
    has_many :users, through: :user_projects

    validates :name, presence: true, length: { maximum: 20 }
end
