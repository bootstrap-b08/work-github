class Item < ApplicationRecord
	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true
	validates :is_active, inclusion: {in: [true, false]}
	validates :genre_id, presence: true
	has_many :cart_items, dependent: :destroy
	has_many :items, dependent: :destroy
	belongs_to :genre, optional: true
	attachment :image
end

def price_with_tax
	(price * Constants::TAX).ceil
end