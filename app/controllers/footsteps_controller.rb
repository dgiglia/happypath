class FootstepsController < ApplicationController
  before_action :set_footstep, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @footsteps = (Footstep.all.limit(Footstep::PER_PAGE).offset(params[:offset])).sort_by{|x| x.created_at}.reverse
    @pages = (Footstep.all.size / Footstep::PER_PAGE) 
    @pages += 1 if (Footstep.all.size % Footstep::PER_PAGE) > 0
  end
  
  def show
    @comment = Comment.new
  end
  
  def new
    @footstep = Footstep.new
  end
  
  def create
    @footstep = Footstep.new(footstep_params)
    @footstep.user = current_user
    if @footstep.save
      flash['notice'] = "Your footstep was successfully created."
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  
  def update
    if @footstep.update(footstep_params)
      flash['notice'] = "Your footstep was successfully updated."
      redirect_to footstep_path(@footstep)
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    if @footstep.destroy
      flash['error'] = "Your footstep was deleted."
      redirect_to user_path(current_user)
    end
  end
  
  def copy
    @existing_footstep = Footstep.find_by(id: params[:id])
    @footstep = Footstep.new(@existing_footstep.attributes)
    @footstep.user_id = current_user.id
    @footstep.category_ids = @existing_footstep.category_ids
  end
  
  private
  def footstep_params
    params.require(:footstep).permit!
  end
  
  def set_footstep
    @footstep = Footstep.find_by slug: params[:id]
  end
  
  def require_same_user
    access_denied unless logged_in? and (current_user == @footstep.user || current_user.admin?)
  end
end