class DonorHistoryQuestionnaire < ApplicationRecord
  belongs_to :user
  belongs_to :donor
  belongs_to :question

  validates :user_id, presence: true
end
