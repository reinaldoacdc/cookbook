class Recipe < ApplicationRecord
	has_one_attached :photo
	belongs_to :cuisine
	belongs_to :recipe_type

	validates :title, :recipe_type_id, :cook_time, :cuisine_id,
						:difficulty, :ingredients, :method, presence: true

end
