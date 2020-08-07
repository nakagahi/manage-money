Rails.application.routes.draw do

# (homeコントローラー)
  # topページへのルーティング
  root "home#top"

  # aboutページへのルーティング
  get "/about", to: "home#about"

# (usersコントローラー)
  resources 'users'

# (sessionsコントローラ-)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
