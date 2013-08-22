class Post < ActiveRecord::Base;
	belongs_to :creator, class_name: 'User', foreign_key: 'user'
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories


	validates :title, :url, presence: true
end