class ChangeUserIdTypeToUuid < ActiveRecord::Migration[6.1]
  def up
    # usersテーブルにuuid追加
    add_column :users, :uuid, :uuid, null: false, default: 'gen_random_uuid()'
    # 関連テーブルにuuid追加
    add_column :keeps, :user_uuid, :uuid
    add_column :likes, :user_uuid, :uuid
    add_column :reviews, :user_uuid, :uuid

    #関連テーブルのuuidを更新。usersのuse_uuidと各関連テーブルのuser_uuidを紐付ける。
    execute <<~SQL
      UPDATE keeps SET user_uuid = users.uuid
      FROM users WHERE keeps.user_id = users.id;
      UPDATE likes SET user_uuid = users.uuid
      FROM users WHERE likes.user_id = users.id;
      UPDATE reviews SET user_uuid = users.uuid
      FROM users WHERE reviews.user_id = users.id;
    SQL

    # usersの元々のprimary keyであるidを消す
    remove_foreign_key :keeps, :users
    # 関連テーブルからの参照を切る(外部キーとして参照されていると消せない)
    remove_reference :keeps, :user, index: true
    remove_foreign_key :likes, :users
    remove_reference :likes, :user, index: true
    remove_foreign_key :reviews, :users
    remove_reference :reviews, :user, index: true

    # usersテーブルのidを消して、追加したuuidのカラム名をidに変更
    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    # usersのuuid化したidをprimary keyとして設定
    execute 'ALTER TABLE users ADD PRIMARY KEY (id);'

    # 関連テーブルに追加したuser_uuidをuser_idに名称変更
    rename_column :keeps, :user_uuid, :user_id 
    rename_column :likes, :user_uuid, :user_id
    rename_column :reviews, :user_uuid, :user_id

    # 関連テーブルのuuid化したuser_idを外部キーとして設定
    add_foreign_key :keeps, :users
    add_index :keeps, :user_id
    change_column_null :keeps, :user_id, false #NULL制約の追加

    add_foreign_key :likes, :users
    add_index :likes, :user_id
    change_column_null :likes, :user_id, false

    add_foreign_key :reviews, :users
    add_index :reviews, :user_id
    change_column_null :reviews, :user_id, false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
