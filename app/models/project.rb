class Project < ApplicationRecord
    has_many :board_lists, dependent: :delete_all
    belongs_to :user

    validates :name, presence: true, length: { maximum: 20 }
end
