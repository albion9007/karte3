class Treatment < ApplicationRecord
  belongs_to :patient, optional: true
end
