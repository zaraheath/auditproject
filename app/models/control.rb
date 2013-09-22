class Control < ActiveRecord::Base

  belongs_to :section

  has_ancestry

end
