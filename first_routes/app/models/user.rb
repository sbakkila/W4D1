# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    class_name: :Contact,
    foreign_key: :user_id

  has_many :contact_shares,
  foreign_key: :user_id,
  class_name: :ContactShare

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact


end
