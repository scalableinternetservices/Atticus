class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :contracts
  has_and_belongs_to_many :skill_tags
  has_and_belongs_to_many :industry_tags
  has_attached_file :avatar, styles: {
      thumb: '130x130>',
      square: '200x200#',
      medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
