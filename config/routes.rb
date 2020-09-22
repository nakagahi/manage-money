Rails.application.routes.draw do

  get "/moneys/:id", to: "moneys#manage"
  resources :moneys



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
  get "/moneyprofiel/:id", to: "users#moneys"

# (sessionsコントローラ-)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/easy/login", to: "sessions#easy"

# (blogコントローラー)
  get "/blogs/border", to: "blogs#border"
  resources :blogs



end
