class Comment < ActiveRecord::Base  
  belongs_to :user
  belongs_to :footstep
  
  validates :body, presence: true
end