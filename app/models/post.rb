class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  validates :image, content_type: { in: %w[image/jpeg, image/gif, image/png],
                                    message: "対応の画像ファイルを指定してください" },
                    size: { less_than: 5.megabytes,
                            message: "ファイルサイズは5MG以下" }
end