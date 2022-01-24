class CommentsController < ApplicationControlller
	
	before_action :authenticate_user!
	
	def create
	@article = Article.find(params[:article_id])
	@comment = @article.comments.create(params[:comment].permit(:body))
	@comment.user_id = current_user.id if current_user
	
	if @comment.save
		redirect_to article_path(@article), notice: "comment is saved."
	else
		redirect_to 'new'
	end
	end
	
	def update
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	
	if @comment.update(params[:comment].permit(:body))
		redirect_to article_path(@article), notice: "comment is updated."
	else
		redirect_to 'new'
	end
	end 
	
	def edit
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	end
	end
	
	def destory
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	@comment.destroy
	
	redirect_to article_path(@article), notice: "comment is deleted"
	
	
	end

end
