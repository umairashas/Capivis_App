class Centre < ApplicationRecord
    belongs_to :user
    has_many :donor_physical_exams, dependent: :destroy
    has_many :donor_screenings, dependent: :destroy
    has_many :donors, dependent: :destroy
end
