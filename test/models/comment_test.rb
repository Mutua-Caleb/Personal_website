# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  commented_on_type :string
#  content           :text
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  commented_on_id   :integer
#  user_id           :bigint           not null
#
# Indexes
#
#  index_comments_on_commented_on_type_and_commented_on_id  (commented_on_type,commented_on_id)
#  index_comments_on_user_id                                (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
