class Vote < Sequel::Model
  many_to_one :post
  many_to_one :comment
end
