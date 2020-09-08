class Observation < ApplicationRecord
  belongs_to :patients, optional: true
end
