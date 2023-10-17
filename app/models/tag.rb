class Tag < ApplicationRecord
  validates :name, presence: true
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :post_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :posts, through: :post_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end