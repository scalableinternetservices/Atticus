class Contract < ActiveRecord::Base
	validates :title, :description, :image_url, :company, presence: true
	validates :pay, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i, 
		message: 'must be a url for GIF, JPG, or PNG image.'
	}
    has_and_belongs_to_many :users
    has_and_belongs_to_many :skill_tags
end
