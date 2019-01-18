class UserSerializer < ActiveModel::Serializer
  has_many :reviews
  attributes :id, :username
end
