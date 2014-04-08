class CommentsController < ApplicationController

	def create
	    @comment = Comment.create comment_params
	    if @comment.save
	      redirect_to :back
	    else
	      redirect_to :back
	      flash.now[:faild] = "faild"
	    end
	end

	private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :entry_id)
    end
end
