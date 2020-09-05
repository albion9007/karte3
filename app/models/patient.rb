class Patient < ApplicationRecord

  has_many :patient_users
  has_many :users, through: :patient_users
  belongs_to :to_do_lists
  has_many :treatments
  has_one :monitors
  has_one_attached :image

end
