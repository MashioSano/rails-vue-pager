module Api
  class PostsController < ApplicationController
    def index
      page = params[:page] || 1
      per = params[:per] || 10
      posts = Post.page(page).per(per)
      total_pages = posts.total_pages
      response = {
        posts: posts.select(:id, :title),
        total_pages: total_pages
      }
      render json: response
    end
  end
end
