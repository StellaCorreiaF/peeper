class Topic < ApplicationRecord
  validates :titulo, presence: true
  has_many :posts
end