class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :upvote, :downvote]
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
	end

	def create
		#render plain: params[:post].inspect
		@post = current_user.posts.build(post_params)

		if (@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if (@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	def upvote
		@post.upvote_from current_user
		redirected_to posts_path
	end

	def downvote
		@post.downvote_from current_user
		redirected_to posts_path
	end


	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
