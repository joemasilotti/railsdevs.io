class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, polymorphic: true
  has_one :developer, through: :conversation
  has_one :business, through: :conversation

  validates :body, presence: true

  after_create :send_recipient_notification

  def sender?(user)
    [user.developer, user.business].include?(sender)
  end

  def recipient
    if sender == developer
      business
    elsif sender == business
      developer
    end
  end

  private

  def send_recipient_notification
    NewMessageNotification.with(message: self).deliver_later(recipient)
  end
end
