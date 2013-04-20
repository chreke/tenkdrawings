module UsersHelper

  def gravatar_for(user)
    id = Digest::MD5::hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{id}"
  end
end
