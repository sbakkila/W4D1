# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  contact_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactShare < ApplicationRecord
  validates :user_id, presence: true
  validates :contact_id, presence: true, :uniqueness => { :scope => :user_id }


  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :contact,
    foreign_key: :contact_id,
    class_name: :Contact
end
