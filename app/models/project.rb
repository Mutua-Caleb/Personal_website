# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text
#  link        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true 
  validates :title, presence: true, length: { in: 5..200 }
  validates :description, presence: true, length: {in: 1..50000} 
  validates :link, presence: true, length: {in: 5.. 200}

  scope :newest_first, lambda { order("created_at   DESC")}
  scope :search, lambda {|query| where("title LIKE?", "%#{query}%")}
  
end
