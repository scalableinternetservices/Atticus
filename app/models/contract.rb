class Contract < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :pay, numericality: {greater_than_or_equal_to: 0.01}
    has_and_belongs_to_many :users
    has_attached_file :picture, styles: {
      thumb: '130x130>'
    },
    :default_url => '/images/picture/missing.png'
    validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
    has_and_belongs_to_many :skill_tags
    has_many :comments

    def root_comments
        comments.where parent_id: nil
    end
      def self.search(query)
              # where(:title, query) -> This would return an exact match of the query
         where("title like ? OR company like ? OR description like ?", "%#{query}%", "%#{query}%", "%#{query}%") 
      end
end
