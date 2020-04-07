class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbaity

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [1-5]*/i, /Guess/i]
  def is_clickbaity
    if CLICKBAIT.none? do |pattern|
      pattern.match title
      end
      errors.add(:title, "Not clickbaity enough")
    end
  end
end
