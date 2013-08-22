class Category < ActiveRecord::Base;
	has_many :memberships
	has_many :post_category
	has_many :posts, through: :post_categories 

	validates :name, presence: :true
end