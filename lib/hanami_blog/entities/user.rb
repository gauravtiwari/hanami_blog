class User
  include Hanami::Entity
  attributes :name, :email, :username, :password, :encrypted_password
end
