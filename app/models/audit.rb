class Audit < ActiveRecord::Base

  belongs_to :user
  has_many :sections, dependent: :destroy

end
