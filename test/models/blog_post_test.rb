require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    # assert expects true
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for a published blog post" do
    # refute expects false
    refute blog_posts(:published).draft?
  end

  test "draft? returns false for a scheduled blog post" do
    # refute expects false
    refute blog_posts(:scheduled).draft?
  end

  test "published? returns true for a published blog post" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for a draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for a scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for a scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end
  
  test "scheduled? returns false for a draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for a published blog post" do
    refute blog_posts(:published).scheduled?
  end

  # helper methods can be used
  # def draft_blog_post
  #   BlogPost.new(published_at: nil)
  # end

  # def published_blog_post
  #   BlogPost.new(published_at: 1.year.ago)
  # end

  # def scheduled_blog_post
  #   BlogPost.new(published_at: 1.year.from_now)
  # end
end
