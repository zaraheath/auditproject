class Control < ActiveRecord::Base

  belongs_to :section

  has_ancestry

  validates :name, presence: true
  validates :section, presence: true

end
