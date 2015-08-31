class Category < ActiveRecord::Base
  include Sluggable
  
  has_many :footstep_categories
  has_many :footsteps, through: :footstep_categories
  
  validates :name, presence: true, uniqueness: true
  
  sluggable_column :name
end