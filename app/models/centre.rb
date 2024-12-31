class Centre < ApplicationRecord
	belongs_to :user
    has_many :donor
    has_many :operators, dependent: :destroy
    has_many :donors
end
