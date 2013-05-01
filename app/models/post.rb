class Post < ActiveRecord::Base
  attr_reader :experience
  attr_accessible :image
  belongs_to :user
  styles = {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image, styles: styles
  after_initialize :roll_experience

  def roll_experience
    @experience = Random::rand(20) + 20;
  end
end
