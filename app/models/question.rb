class Question < ApplicationRecord
  validates :text, presence: true
    validates :answer_type, inclusion: { in: ['true_false', 'text'] }
   has_many :donor_history_questionnaires, dependent: :destroy   
end
