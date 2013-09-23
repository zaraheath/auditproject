class Section < ActiveRecord::Base

  belongs_to :audit
  has_many :controls

  validates :name, presence: true
  validates :audit, presence: true

end
