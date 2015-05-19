class Contract < ActiveRecord::Base
	validates :title, :description, :company, presence: true
	validates :pay, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
    has_and_belongs_to_many :users
    has_attached_file :picture, styles: {
      thumb: '130x130>'
    }
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
