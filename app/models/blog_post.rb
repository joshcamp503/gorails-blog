class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # these lambda functions are SQL queries, thus the foreign syntax/?'s
  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
  # desc is short for descending (order)
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled? 
    published_at? && published_at > Time.current
  end
end