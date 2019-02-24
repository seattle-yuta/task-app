class CheckList < ApplicationRecord
    has_many :check_items, dependent: :delete_all
    belongs_to :card

    validates :name, presence: true
end
