class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :contracts
  has_and_belongs_to_many :skill_tags
  has_and_belongs_to_many :industry_tags
  attr_accessor :skill_tag_name
  attr_accessor :industry_tag_name
  has_attached_file :avatar, styles: {
      thumb: '130x130>',
      square: '200x200#',
      medium: '300x300>'
  },
  :default_url => '/images/avatar/missing.jpg'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Only accepts school emails if student
  #  validates_format_of :email, :with => /\A(\S+)@(.+)\.(edu)\z/, :if => :is_student, :message => "Students must register with a .edu email address"

      def self.search(query)
              # where(:title, query) -> This would return an exact match of the query
         where("first_name like ? OR last_name like ? OR school like ? OR corporation like ? OR profile like ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") 
      end

end
