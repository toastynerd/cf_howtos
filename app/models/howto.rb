class Howto < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :steps

  validates :title, :presence => true
  validates :description, :presence => true
end
