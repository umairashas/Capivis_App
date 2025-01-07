class CreateDonorPhysicalExams < ActiveRecord::Migration[7.2]
  def change
    create_table :donor_physical_exams do |t|
      t.boolean :flipchart
      t.boolean :donor_consents
      t.text :body_map
      t.integer :high_risk_questionnaire_score
      t.boolean :physical_exam
      t.references :donor, null: false, foreign_key: true
      t.references :centre, null:false, foreign_key: true  
      t.references :donor_screening, null:false, foreign_key: true  
      t.timestamps
    end
  end
end
