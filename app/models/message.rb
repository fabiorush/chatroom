class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
  scope :last_messages, -> { order(:created_at).last(10) }
end
