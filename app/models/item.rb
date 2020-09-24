class Item < ApplicationRecord
	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true
	validates :is_active, inclusion: {in: [true, false]}
	validates :genre_id, presence: true
	has_many :cart_items, dependent: :destroy
	belongs_to :genre, optional: true
	attachment :image

	def self.search(word)
    if word == ""
      @items = Item.all
    else
      @items = Item.where("name LIKE?", "%#{word}%")
    end
  end
end
