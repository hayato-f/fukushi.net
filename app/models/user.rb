class User < ApplicationRecord
    before_save { self.email = email.downcase }   #データベースに保存する前に、強制的に小文字に変換。（大文字、小文字は同一と、認識して欲しいため）
                                                    #self => 既存のユーザーを指す。右辺はself.email.downcasの省略
    #↓nameに値が存在していたら、validate(有効)
    validates :name, presence: true  , length: {maximum:50}
    validates :email, presence: true, length: {maximum:255},
                    uniqueness: { case_sensitive: false } #emailの一意性
    has_secure_password   #ハッシュかしたパスワードをpassword_digestカラムに保存可能になる。
                            #　authenticateメソッドが使用できるようになる。
                            # 他にもできるようになる事がある。要チェック。
    validates :password, presence: true, length: { minimum:6 }
    
    # 渡された文字列のハッシュ値を返す
    def User.digest(string)                                                         # 定義したおかげで、fixtureが作成できるようになった。
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
