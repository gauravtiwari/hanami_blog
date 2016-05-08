class Comment
  include Hanami::Entity
  attributes :body, :user_id, :post_id
end
