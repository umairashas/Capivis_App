class Operator < ApplicationRecord
    belongs_to :user
    has_many :donor_screenings
    has_many :donor_physical_exams
    
end
