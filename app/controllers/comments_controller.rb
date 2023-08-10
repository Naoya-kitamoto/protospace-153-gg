class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
  end

  private
    def comment_params
      params.require(:prototype).permit(:image, :prototype_name, :copy, :concept).merge(user_id: current_user.id)
    end
end
