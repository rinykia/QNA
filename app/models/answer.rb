class Answer < ActiveRecord::Base
  belongs_to :question, touch: true
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable
  belongs_to :user
  
  validates :body, presence: true

  accepts_nested_attributes_for :attachments

  default_scope -> {order :created_at}

  after_create :calculate_rating

  private

  def calculate_rating
    Reputation.delay.calculate(self)
  end
end
