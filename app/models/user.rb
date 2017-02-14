class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
	after_create :send_email_when_new_user

  def send_email_when_new_user
    UserMailer.new_user(email).deliver_now
  end
end
