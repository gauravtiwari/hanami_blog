Hanami::Model.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :title, String,  null: false
      column :body,  String,  null: false, text: true
    end
  end
end
