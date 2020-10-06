class Treatment < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :user, optional: true
end
