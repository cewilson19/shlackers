class PostCategory < ActiveRecord::Base;
	belongs_to :post
	belongs_to :category

	validates :title, presenence :true
end