include SessionsHelper


def log_in(user)
  session[:user_id] = user.id
end

def is_logged_in?

  !session[:user_id].nil?

end
