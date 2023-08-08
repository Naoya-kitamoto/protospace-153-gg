class PrototypesController < ApplicationController
  def index
  end
  
  def show
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
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:image, :prototype_name, :copy, :concept).merge(user_id: current_user.id)
  end
end
