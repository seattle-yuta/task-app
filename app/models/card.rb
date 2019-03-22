class Card < ApplicationRecord
    has_many :check_lists, dependent: :delete_all
    belongs_to :board_list

    validates :name, presence: true

    scope :search_cards, lambda { |query|
        s = where(display_order: query[:display_order])
        s = s.where('name LIKE ?', "%#{query[:name]}%") unless query[:name].blank?
        s = s.where('detail LIKE ?', "%#{query[:detail]}%") unless query[:detail].blank?
        s
    }
end
