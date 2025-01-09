class DonorHistoryQuestionnaire < ApplicationRecord
  belongs_to :donor
  belongs_to :question
end
