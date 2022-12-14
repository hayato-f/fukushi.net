# メインのサンプルユーザーを1人作成する
User.create!(name:  "hoge",
    email: "hoge@email.com",
    password:              "hogepass",
    password_confirmation: "hogepass",
    admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
        email: email,
        password:              password,
        password_confirmation: password)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.paragraph(sentence_count: 5)
    users.each { |user| user.posts.create!(content: content) }
end