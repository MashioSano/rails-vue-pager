class PostsController < ApplicationController
  def index
    p "paramsのパラメータ"
    p params[:page]
  end
end
