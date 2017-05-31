class Question
	
  include Mongoid::Document
  include Mongoid::Timestamps
  field :question, type: String
  field :tag, type: String

  validates :question, presence: true
  validates :question, uniqueness: true

  belongs_to :user, :foreign_key => 'user_id'
  embeds_many :answers
  accepts_nested_attributes_for :answers

  # def self.tag
    
  # end
end
