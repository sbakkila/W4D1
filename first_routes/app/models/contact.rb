# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
    validates :name, presence: true
    validates :user_id, presence: true
    validates :email, presence: true, :uniqueness => { :scope => :user_id }
    

    belongs_to :user,
      class_name: :User,
      foreign_key: :user_id

    has_many :contact_shares,
      foreign_key: :contact_id,
      class_name: :ContactShare

    has_many :shared_users,
    through: :contact_shares,
    source: :user
end
