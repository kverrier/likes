class Likeable < ActiveRecord::Base
  attr_accessible :name, :rt_id

  validates_presence_of :name
  validates_uniqueness_of :name

  ajaxful_rateable :stars => 10, :allow_update => true

end
