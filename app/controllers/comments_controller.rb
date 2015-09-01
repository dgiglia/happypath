class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @footstep = Footstep.find_by slug: params[:footstep_id]
    @comment = @footstep.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash['notice'] = "Your comment was successfully created."
      redirect_to footstep_path(@footstep)
    else
      render 'footsteps/show'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit!
  end
end