class LikesController < ApplicationController

    def create
      like = current_tag.likes.create(post_id: params[:post_id]) #tag_idとpost_idの二つを代入
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      like = Like.find_by(post_id: params[:post_id], tag_id: current_tag.id)
      like.destroy
      redirect_back(fallback_location: root_path)
    end
  
  end