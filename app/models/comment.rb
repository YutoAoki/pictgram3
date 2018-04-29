class Comment < ApplicationRecord
  validates :comment_text, presence: true



  belongs_to :topic
  belongs_to :user
end
