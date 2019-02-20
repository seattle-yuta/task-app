class BoardList < ApplicationRecord
    has_many :cards, dependent: :delete_all
    belongs_to :projects
end
