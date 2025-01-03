class CreateDonorScreenings < ActiveRecord::Migration[7.2]
  def change
    create_table :donor_screenings do |t|
      t.boolean :acceptable_arm_check
      t.integer :donor_height
      t.integer :donor_weight
      t.string :donor_blood_pressure
      t.decimal :donor_temperature
      t.datetime :fingerstick
      t.decimal :hematocrit
      t.decimal :total_protein
      t.references :centre, null: false, foreign_key: true
      t.references :donor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
