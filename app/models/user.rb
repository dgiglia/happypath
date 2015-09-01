class User < ActiveRecord::Base
  include Sluggable
  
  has_many :footsteps
  has_many :comments
  
  has_secure_password validations: false
  validates :password, presence: true, on: :create, length: {minimum: 6}
  validates :username, presence: true, uniqueness: true
  
  sluggable_column :username
  
  def admin?
    self.role == 'admin'
  end
  
  def moderator?
    self.role == 'moderator'
  end
  
  def count_completed
    footsteps.where(completed: true).count
  end

end