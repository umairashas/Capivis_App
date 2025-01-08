class CreateOperators < ActiveRecord::Migration[7.2]
  def change
    create_table :operators do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
