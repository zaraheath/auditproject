class Audit < ActiveRecord::Base

  belongs_to :user
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

end
