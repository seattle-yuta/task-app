class Project < ApplicationRecord
    has_many :board_lists, dependent: :delete_all
end
