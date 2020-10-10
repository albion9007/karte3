class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :patient_users
  has_many :patients, through: :patient_users
  has_many :treatments

  with_options presence: true do
    validates :name, uniqueness: { case_sensitive: true }, length: { maximum: 15 }
    validates :position
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, on: :create, message: ''
end
