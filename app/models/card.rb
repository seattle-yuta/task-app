class Card < ApplicationRecord
    has_many :check_lists, dependent: :delete_all
    belongs_to :board_list

    validates :name, presence: true
end
