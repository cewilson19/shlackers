class Category < ActiveRecord::Base;
	has_many :memberships
	has_many :post_category
	has_many :posts, through: :post_categories 

	validates :name, presence: :true

	def generate_slug
		self.slug= self.title.gsub(" ","-").downcase
	end

	def to_param
		self.slug
	end
end