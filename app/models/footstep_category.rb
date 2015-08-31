class FootstepCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :footstep
end