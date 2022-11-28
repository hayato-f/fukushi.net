class User < ApplicationRecord
    has_many :favorites, dependent: :destroy  #中間テーブルのアソシエーションの順番に気をつける      #, foreign_key: :user_id
    has_many :posts, dependent: :destroy, through: :favorites   #throughを定義しないとリレーションが組めない。
    # has_one_attached :image
    mount_uploader :image, IconImagesUploader # アイコン

    before_save { self.email = email.downcase }   #データベースに保存する前に、強制的に小文字に変換。（大文字、小文字は同一と、認識して欲しいため）
                                                    #self => 既存のユーザーを指す。右辺はself.email.downcasの省略
    #↓nameに値が存在していたら、validate(有効)
    validates :name, presence: true  , length: {maximum:50}
    validates :email, presence: true, length: {maximum:255},
                    uniqueness: { case_sensitive: false } #emailの一意性
    has_secure_password   #ハッシュかしたパスワードをpassword_digestカラムに保存可能になる。 => このメソッドのおかげで、user新規作成時は、有効なパスワードがないと、trueにならない。
                            #　authenticateメソッドが使用できるようになる。
                            # 他にもできるようになる事がある。要チェック。
    validates :password, presence: true, length: { minimum:6 }, allow_nil: true  #allow_nil: true => プロフィール更新時には、パスワード未入力でもOK
    
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)                                                         # 定義したおかげで、fixtureが作成できるようになった。
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def feed
        # Post.where("user_id = ?", id)  => 任意のユーザーの投稿のみ表示。フォロー機能をつけて、フォローユーザーの投稿をみれるようにする。
        Post.all # => 全ユーザーの投稿を表示する
    end
end
