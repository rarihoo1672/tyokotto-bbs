class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
        format.json
      end
    else
      flash[:danger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end 
  end 

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
