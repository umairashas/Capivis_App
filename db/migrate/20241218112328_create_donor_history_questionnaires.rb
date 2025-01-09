  class CreateDonorHistoryQuestionnaires < ActiveRecord::Migration[7.2]
  def change
    create_table :donor_history_questionnaires do |t|
      t.references :donor, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.text :answer
      t.timestamps
    end
  end
end
