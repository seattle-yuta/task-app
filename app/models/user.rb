class User < ApplicationRecord
  has_many :user_projects, dependent: :delete_all
  has_many :project, through: :user_projects

  validates :name, presence: true, length: { maximum: 20 }
end
