Sequel.migration do
  change do
    create_table :comments do
      primary_key :id

      foreign_key :post_id, :posts, on_delete: :cascade, null: false
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :body,  String,  null: false, text: true
    end
  end
end
