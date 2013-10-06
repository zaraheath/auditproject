class Control < ActiveRecord::Base

  GRADES_KEYS = { 0 => 'non_existent',
                  1 => 'initial',
                  2 => 'repeatable',
                  3 => 'defined',
                  4 => 'managed',
                  5 => 'optimized'}

  belongs_to :section
  has_many :questions

  has_ancestry

  validates :name, presence: true
  validates :result, presence: true
  validates :section, presence: true

  def grade
    GRADES_KEYS[self.grade_id]
  end

end
