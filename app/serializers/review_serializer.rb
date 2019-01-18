class ReviewSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :show_id, :rating, :content
end
