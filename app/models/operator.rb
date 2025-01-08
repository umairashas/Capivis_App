class Operator < ApplicationRecord
    belongs_to :user
    has_many :centres, dependent: :destroy
end
