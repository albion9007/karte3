class Patient < ApplicationRecord
  has_many :patient_users, dependent: :destroy
  has_many :users, through: :patient_users
  # belongs_to :to_do_lists
  # has_many :treatments
  has_many :observations, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :gender
    validates :prefecture_id, numericality: { greater_than: 1, message: 'Select' }
    validates :main_disease
    validates :main_doctor
  end
end
