class TestProgress < ApplicationRecord
  belongs_to :user

  MAX_CLEAR_COUNT = 7

  def increment_clear!
    return if max_cleared?

    increment!(:cleared_count)
    update!(max_cleared: true) if cleared_count >= MAX_CLEAR_COUNT
  end
end
