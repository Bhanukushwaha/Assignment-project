class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :profiles, as: :imagable
  belongs_to :company
  validate :check_date
  belongs_to :role  
  def check_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date") 
    end 
  end
end
  