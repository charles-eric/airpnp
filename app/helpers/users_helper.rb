module UsersHelper
  def picture_for(user)
    user.picture_file_name ? image_tag(user.picture.url(:thumb), class: 'img-avatar') : image_tag('mickey.jpg', class: 'img-avatar')
  end
end
