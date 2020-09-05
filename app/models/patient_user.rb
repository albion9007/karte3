class PatientUser < ApplicationRecord

  belongs_to :patient
  belongs_to :user

end
