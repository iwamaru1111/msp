class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  #postsテーブルから中間テーブルに対する関連付け
  has_many :post_tag_relations, dependent: :destroy
  #postsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tags, through: :likes, source: :tag
end