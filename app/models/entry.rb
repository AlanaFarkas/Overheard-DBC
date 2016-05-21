class Entry < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :commenters, through: :comments, source: :user
  validates :title, :body, presence: true
end
