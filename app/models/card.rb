class Card < ApplicationRecord
    has_many :check_lists, dependent: :delete_all
    belongs_to :bord_list
end
