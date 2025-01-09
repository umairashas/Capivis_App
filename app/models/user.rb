class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_one :donor, dependent: :destroy
  has_one :operator, dependent: :destroy
   # validates :first_name, :last_name, :email, presence: true
   # validates :aadhar_number, presence: true, length: { is: 12 }, numericality: { only_integer: true }
   enum :role, { donor: 0, admin: 1, operator: 2 }

  def admin?
    self.role == "admin"
  end

  after_create :create_operator_if_operator_role

  private

  def create_operator_if_operator_role
    return unless role == 'operator'

    Operator.create(user: self)
  end

end
