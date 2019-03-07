class User < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :cars
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def count_unread
    result = 0
    self.received_messages.each do |message|
      if !message.status
        result +=1
      end
    end
    if result.zero?
      return ''
    else
      return "(#{result})"
    end
  end
end
