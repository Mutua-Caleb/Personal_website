# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  status     :integer          default("draft")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
	enum status: { draft: 0, published: 1}
  belongs_to :user
  validates :user_id, presence: true 
  validates :content, presence: true, length: {in: 1..50000 }
  validates :title, presence: true, length: {in: 5..200} 

  has_many :comments, as: :commented_on

  scope :newest_first, lambda { order("created_at   DESC")}
  scope :search, lambda {|query| where("title LIKE?", "%#{query}%")}
  


end
