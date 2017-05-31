class Answer

  include Mongoid::Document
  include Mongoid::Timestamps
  field :ans, type: String

  validates :ans, presence: true
  validates :ans, uniqueness: true
  
  embedded_in :question
end
