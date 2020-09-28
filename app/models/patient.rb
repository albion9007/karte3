class Patient < ApplicationRecord
  has_many :patient_users, dependent: :destroy
  has_many :users, through: :patient_users
  # has_many :treatments
  has_many :observations, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  REGISTER_LIMIT_COUNT = 4 # 定数として登録数を管理

  validate :limit_patient_register_count, on: :create  # 作成したメソッドでバリデーション

  def limit_patient_register_count
    if self.gender == "男性" && Patient.where(gender: "男性").count >= REGISTER_LIMIT_COUNT
        errors.add(:patient, "male count is over") # エラーを追加
    elsif self.gender == "女性" && Patient.where(gender: "女性").count >= REGISTER_LIMIT_COUNT
        errors.add(:patient, "female count is over")
    end
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :gender
    validates :prefecture_id, numericality: { greater_than: 1, message: 'Select' }
    validates :main_disease
    validates :main_doctor
  end
end
