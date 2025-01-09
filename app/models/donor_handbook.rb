class DonorHandbook < ApplicationRecord
  validates :terms_accepted, acceptance: { accept: true, message: "must be accepted to create a donor handbook" }
  belongs_to :donor
end
