class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @posts= Post.all
    @tags = Tag.all
    @posts = @posts.where("who LIKE ? ",'%' + params[:search] + '%') if params[:search].present?
    #もしタグ検索したら、post_idsにタグを持ったidをまとめてそのidで検索
    if params[:tag_ids].present?
      post_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).posts.each do |p| 
            post_ids << p.id
          end
        end
      end
      post_ids = post_ids.uniq
      #キーワードとタグのAND検索
      @posts = @posts.where(id: post_ids) if post_ids.present?
    end
  end
  
    
    #追加箇所
      def new
        @post = Post.new
      end
    
      def create
        post = Post.new(post_params)
        if post.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
def top
  
end

      private
      def post_params
        params.require(:post).permit(:image, :youtube_url, :who, :music, :content, tag_ids: [])

      end
    
    end