class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum user_type: [:customer,:shopkeeper,:admin,:user]
  scope :all_except, ->(user) { where.not(id: user) }
  has_many :orders
  
  after_create :send_email

  def send_email
    ConfirmationMailer.confirmation_email(self).deliver
  end       
end
