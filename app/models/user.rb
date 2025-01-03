class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_one :donor, dependent: :destroy
  has_many :donor_history_questionnaire, dependent: :destroy
  has_many :centres, dependent: :destroy
 # validates :first_name, :last_name, :email, presence: true
   # validates :aadhar_number, presence: true, length: { is: 12 }, numericality: { only_integer: true }
   enum :role, {:donor=>0, :admin=>1, :operator=>2}
   def admin?
    self.role == 'admin'
  end    
end
