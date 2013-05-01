class Post < ActiveRecord::Base
  attr_reader :experience
  attr_accessible :image
  belongs_to :user
  styles = {:medium => "300x300>", :thumb => "100x100>"}
  has_attached_file :image, styles: styles
  after_initialize :roll_experience

  # TODO: Change random factor to be logarithmic so we get a bell
  # curve?
  def roll_experience
    @experience = Random::rand(50) + 50;
  end
end
