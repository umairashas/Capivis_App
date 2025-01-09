class DonorScreening < ApplicationRecord
  belongs_to :centre
  belongs_to :donor
  belongs_to :operator
  has_one :donor_physical_exam
end
