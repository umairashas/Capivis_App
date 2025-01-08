class CreateCentres < ActiveRecord::Migration[7.2]
  def change
    create_table :centres do |t|
      t.string :name
      t.string :pincode
      t.string :location
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.references :operator, null: false, foreign_key: true
      t.timestamps
    end
  end
end
