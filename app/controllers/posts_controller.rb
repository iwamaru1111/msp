class PostsController < ApplicationController

    def index
      
        if params[:search] == nil
            @posts= Post.all
          elsif params[:search] == ''
            @posts= Post.all
          else
            #部分検索
            @posts = Post.where("who LIKE ? ",'%' + params[:search] + '%')
          end
        if params[:tag_ids]
            @posts = []
            params[:tag_ids].each do |key, value|      
              @posts += Tag.find_by(name: key).posts if value == "1"
            end
            @posts.uniq!
        end
        
        # 以下を追記
        if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_posts = Tag.find_by(name: key).posts
              @posts = @posts.empty? ? tag_posts : @posts & tag_posts
            end
          end
        end

        if params[:tag]
          Tag.create(name: params[:tag])
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
    
      private
      def post_params
        params.require(:post).permit(:image, :youtube_url, :who, :music, :content, tag_ids: [])

      end
    
    end