class Step < ActiveRecord::Base
  belongs_to :howto
  attr_accessible :description, :title

  validates :title, :presence => true
  validates :description, :presence => true
end
