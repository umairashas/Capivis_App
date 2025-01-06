class CreateOperators < ActiveRecord::Migration[7.2]
  def change
    create_table :operators do |t|
      t.timestamps
    end
  end
end
