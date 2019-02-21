class CheckItem < ApplicationRecord
    belongs_to :check_list

    validates :name, presence: true
end
