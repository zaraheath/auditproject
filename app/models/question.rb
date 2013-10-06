class Question < ActiveRecord::Base

  ANSWER_KEYS = { 0 => 'no',
                  1 => 'yes',
                  2 => 'partially'}

  belongs_to :control

  def answer
    ANSWER_KEYS[self.answer_id]
  end

end
