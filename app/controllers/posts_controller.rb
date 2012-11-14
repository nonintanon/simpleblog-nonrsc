class PostsController < ApplicationController
#before_filter :get_post, only: [:edit, :update, :show, :destr]


	def index
		@posts = Post.all
	end

	def show
		@post = get_post
	end

	def edit
		@post = get_post
	end

	def new
		@post = Post.new
	end

	def update
		@post = get_post
		if @post.update_attributes(params[:post]) then redirect_to posts_path else render :edit end
	end

	def create
		@post = Post.new(params[:post])
		if @post.save then redirect_to posts_path else render :new end
	end

	def destroy
		@post = get_post

		unless @post.destroy
			flash[:notice] = "Post could not be deleted"
		end		

		#flash[:notice] = "Post could not be deleted" unless @post.destroy

		redirect_to posts_path
	end

	private 
	def get_post
		Post.find(params[:id])
	end
end