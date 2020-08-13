Rails.application.routes.draw do

# (mainコントローラー)
  get "/main", to: "main#top"
  get '/income', to: "main#income"
  get '/outcome', to: "main#outcome"
  post '/income', to: "main#save"
  post "/outcome/:out", to: "main#save"

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
