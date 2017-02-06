class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :name, presence: true
  monetize :price_cents

	def highest_rating_comment
  	comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_desc.last
	end
	
  def average_rating
    comments.average(:rating).to_f
  end

  def self.search(search_term)
  	if Rails.env.development?
      where("name LIKE ?", "%#{search_term}%")
    else
      where("name ilike ?", "%#{search_term}%")
    end
  end

end