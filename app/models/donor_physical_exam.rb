class DonorPhysicalExam < ApplicationRecord
  belongs_to :donor
  belongs_to :centre
  belongs_to :donor_screening
end
