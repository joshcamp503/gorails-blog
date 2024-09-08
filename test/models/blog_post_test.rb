require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    # assert expects true
    assert draft_blog_post.draft?
  end

  test "draft? returns false for a published blog post" do
    # refute expects false
    refute published_blog_post.draft?
  end

  test "draft? returns false for a scheduled blog post" do
    # refute expects false
    refute scheduled_blog_post.draft?
  end

  test "published? returns true for a published blog post" do
    assert published_blog_post.published?
  end

  test "published? returns false for a draft blog post" do
    refute draft_blog_post.published?
  end

  test "published? returns false for a scheduled blog post" do
    refute scheduled_blog_post.published?
  end

  test "scheduled? returns true for a scheduled blog post" do
    assert scheduled_blog_post.scheduled?
  end
  
  test "scheduled? returns false for a draft blog post" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns false for a published blog post" do
    refute published_blog_post.scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end

  def published_blog_post
    BlogPost.new(published_at: 1.year.ago)
  end

  def scheduled_blog_post
    BlogPost.new(published_at: 1.year.from_now)
  end
end
