class Comment < ActiveRecord::Base
    belongs_to :contract
    belongs_to :parent, class_name: 'Comment'
    has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'

    validates_presence_of :parent, if: 'parent_id.present?'
    validates :message, presence: true
end
