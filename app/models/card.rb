class Card < ApplicationRecord
    has_many :check_lists, dependent: :delete_all
    belongs_to :board_list

    validates :name, presence: true

    scope :search_card, -> (status){
        s = where(name: status.name)
        s = s.where(display_order: status.display_order) unless status.display_order.blank?
        s = s.where(detail: status.detail) unless status.detail.blank?
        s
    }

end
