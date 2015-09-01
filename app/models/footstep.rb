class Footstep < ActiveRecord::Base
  PER_PAGE = 10
  
  include Sluggable
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :footstep_categories
  has_many :categories, through: :footstep_categories
  
  validates :title, presence: true
  
  sluggable_column :title
  
  def completed?
    self.completed == true
  end
  
  def private?
    self.private == true
  end
    
end