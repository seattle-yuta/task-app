class BoardList < ApplicationRecord
    has_many :cards, dependent: :delete_all
    belongs_to :project

    validates :name, presence: true

    scope :desc_display_order, -> {
        order(display_order: :desc)
    }

end
