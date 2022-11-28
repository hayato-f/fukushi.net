class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy #foreign_key: :post_id
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :image, content_type: { in: %w[image/jpeg, image/gif, image/png],
                                    message: "対応の画像ファイルを指定してください" },
                    size: { less_than: 5.megabytes,
                            message: "ファイルサイズは5MG以下" }

  # def feed
  #   # Post.where("user_id = ?", id)  => 任意のユーザーの投稿のみ表示。フォロー機能をつけて、フォローユーザーの投稿をみれるようにする。
  #   Post.all # => 全ユーザーの投稿を表示する
  # end
end