class CreateDonorHandbooks < ActiveRecord::Migration[7.2]
  def change
    create_table :donor_handbooks do |t|
      t.boolean :terms_accepted
      t.references :donor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
