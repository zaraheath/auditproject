class Section < ActiveRecord::Base

  belongs_to :audit
  has_many :controls

end
