class AddFieldToDonors < ActiveRecord::Migration[7.2]
  def change
    add_column :donors, :first_name, :string
    add_column :donors, :middle_name, :string
    add_column :donors, :last_name, :string
    add_column :donors, :birth_date, :date
    add_column :donors, :gender, :string
    add_column :donors, :zipcode, :string
    add_column :donors, :phone_number, :string
    add_column :donors, :alternate_phone_number, :string
    add_column :donors, :city, :string
    add_column :donors, :state, :string
    add_column :donors, :country, :string
    add_column :donors, :language, :string
    add_column :donors, :address_line1, :string
    add_column :donors, :address_line2, :string
    add_column :donors, :document, :text
    add_column :donors, :arrival_datetime, :datetime
    add_column :donors, :potential_fraud, :string
  end
end
