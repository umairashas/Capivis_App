class CreateDonors < ActiveRecord::Migration[7.2]
  def change
    create_table :donors do |t|
      t.references :user, foreign_key: true
      t.references :centre, foreign_key: true
      t.timestamps
    end
  end
end
