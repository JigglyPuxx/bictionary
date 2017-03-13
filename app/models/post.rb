class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates :title, presence: true,
						length: {minimum: 2}

	acts_as_votable
end
