class User < ActiveRecord::Base  
  has_many :entries
  has_many :comments
  has_many :entries_commented_on, through: :comments, source: :entry
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
