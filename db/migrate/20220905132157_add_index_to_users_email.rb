class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true   #add_indexメソッドでデータベースへの検索を効率化（索引検索のようなもの）
                                              # uniqueメソッドで一意性を強制
  end
end
