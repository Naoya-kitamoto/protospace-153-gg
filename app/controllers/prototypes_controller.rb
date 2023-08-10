class PrototypesController < ApplicationController
  before_action :move_to_log_in, only: [:edit, :new]
  before_action :move_to_show, only: [:edit]

  def index
    @prototypes = Prototype.all
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  def edit

  end

  def update
    @prototype = Prototype.find(params[:id])
      if @prototype.update(prototype_params)
        redirect_to @prototype, notice: "Updated successfully"
      else
        render :edit, status: :unprocessable_entity
      end
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:image, :prototype_name, :copy, :concept, :user).merge(user_id: current_user.id)
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def move_to_show
    @prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id != @prototype.user_id
      redirect_to "/prototypes"
    end
  end

end
