class Post < ActiveRecord::Base;
	belongs_to :creator, class_name: 'User', foreign_key: 'user'
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :votes, as: :voteable

	validates :title, :url, presence: true

	def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  	end
	
end