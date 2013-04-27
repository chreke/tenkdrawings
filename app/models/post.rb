class Post < ActiveRecord::Base
  attr_accessible :image
  belongs_to :user
  styles = {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image, styles: styles
end
