Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :name, String,  null: false, size: 255
      column :email, String,  null: false, size: 255
      column :username, String,  null: false, size: 255
      column :password, String,  null: false, size: 255
      column :encrypted_password, String,  null: false, size: 255
    end
  end
end
