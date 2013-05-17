class Howto < ActiveRecord::Base
  attr_accessible :description, :title
has_many :steps, :dependent => :delete_all

  validates :title, :presence => true
  validates :description, :presence => true
end
