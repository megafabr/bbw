module ApplicationHelper
  # Если у пользователя есть собственный аватар, то показываем его,
  # иначе — стандартную иконку.
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      asset_path('user.png')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

end
