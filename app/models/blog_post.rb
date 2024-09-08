class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  # these lambda functions are SQL queries, thus the foreign syntax/?'
  # in production, nulls are sorted differently and we must add NULLS LAST to our 
  # SQL query, but nulls last is not an option for the basic order command in ActiveRecord
  # so we use arel_table to get that extended functionality
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
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