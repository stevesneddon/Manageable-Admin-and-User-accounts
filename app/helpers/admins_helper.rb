module AdminsHelper
  
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(admin, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(admin.email.downcase)
    size = options[:size]
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: admin.name, class: "gravatar")
  end
end
