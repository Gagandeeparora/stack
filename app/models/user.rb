class User
	include ActiveModel::SecurePassword
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :user_name, type: String
  field :password_digest, type: String

  validates :name, :user_name, :email, :password_digest, presence: true
  validates :user_name, :email, uniqueness: true
  has_secure_password

  has_many :questions
end
