class Product < ApplicationRecord
	validates :name, presence: true
	has_many :orders
	has_many :comments

	#def self.search(search_term)
  #  if (Rails.env == "production")
  #    @products = Product.where("name ilike ?", "%#{search_term}%")
  #  else
  #   	@products = Product.where("name LIKE ?", "%#{search_term}%")
  #  end
  #end

  def views
  	$redis.get("product:#{id}")
  end

  def viewed
  	$redis.incr("product:#{id}")
  end

	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end
end
