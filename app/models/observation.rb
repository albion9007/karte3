class Observation < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :patient, optional: true
end
