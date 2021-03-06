class PostsController < ApplicationController
  include PostsHelper
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    
    flash.notice = "Post '#{@post.title}' created!"
    
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash.notice = "Post '#{@post.title}' deleted!"
    
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    flash.notice = "Post '#{@post.title}' updated!"
    
    redirect_to post_path(@post)
  end
  
  
end
