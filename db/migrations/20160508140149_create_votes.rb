Sequel.migration do
  change do
    create_table :votes do
      primary_key :id

      foreign_key :post_id, :posts, on_delete: :cascade, null: false
      foreign_key :user_id, :users, on_delete: :cascade, null: false
      foreign_key :comment_id, :comments, on_delete: :cascade, null: false
    end
  end
end
