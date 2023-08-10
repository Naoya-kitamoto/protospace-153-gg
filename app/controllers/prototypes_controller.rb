class PrototypesController < ApplicationController
  before_action :move_to_log_in, only: [:edit]

  def index
    @prototypes = Prototype.all
    #@prototypes = Prototype.find(1)
  end
  
  def show
    @prototype = Prototype.find(params[:id])
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
    @prototype = Prototype.find(params[:id])
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
    params.require(:prototype).permit(:image, :prototype_name, :copy, :concept).merge(user_id: current_user.id)
  end
  def move_to_log_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
