class User < ApplicationRecord
  has_many :reviews
  has_many :shows, through: :reviews
end
