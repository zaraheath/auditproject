class Audit < ActiveRecord::Base

  belongs_to :user
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

  validates_associated :sections

  accepts_nested_attributes_for :sections, reject_if: proc { |attributes| attributes['name'].blank? and attributes['description'].blank? }

end
