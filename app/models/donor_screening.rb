class DonorScreening < ApplicationRecord
  belongs_to :centre
  belongs_to :donor
  has_one :donor_physical_exam
end
