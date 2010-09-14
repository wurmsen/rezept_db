class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Kommentar gespeichert"
    else
      flash[:error] = "Kommentar konnte nicht gespeichert werden!"
    end
    redirect_back_or_default recipe_url(@comment.recipe)
  end
end
