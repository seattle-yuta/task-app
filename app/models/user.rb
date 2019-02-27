class User < ApplicationRecord
  has_secure_password validations: true
  has_many :projects, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :mail, presence: true

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

end
