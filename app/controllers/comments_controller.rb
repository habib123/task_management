class CommentsController < ApplicationController
  load_resource :campaign
  load_resource :todo
  load_and_authorize_resource :comment, through: [:campaign, :todo]

  respond_to :json, :html

  def index
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    flash[:notice] = "Camments was successfully created." if @comment.save
    respond_with(@commentable)
  end

  private

    def comment_params
      params.require(:comment).permit(:title)
    end
end
