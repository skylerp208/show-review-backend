class ShowSerializer < ActiveModel::Serializer
  has_many :reviews
  attributes :id, :title, :genre, :description, :image
end
