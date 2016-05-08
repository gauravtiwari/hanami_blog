class Vote
  include Hanami::Entity
  attributes :post_id, :comment_id, :user_id
end
