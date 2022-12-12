Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/menu' => 'menu#show'

  get '/offers' => 'offers#show'
  post '/offers/create' => 'offers#create'
  put '/offers/update' => 'offers#update'
  delete '/offers/remove' => 'offers#remove'

  get '/order/:order_id/status' => 'order#status'
  post '/order/create' => 'order#create'
  put '/order/update_status' => 'order#update_status'
  post '/order/notify' => 'order#notify'

  post '/cart/update' => 'cart#update'

  post '/payment/:order_id/update' => 'payment#update'

  get '/item_categories' => 'item_categories#show'
  post '/item_categories/add' => 'item_categories#add'
  put '/item_categories/update' => 'item_categories#update'
  delete '/item_categories/remove' => 'item_categories#remove'

  get '/items' => 'items#show'
  post '/items/add' => 'items#add'
  put '/items/update' => 'items#update'
  delete '/items/remove' => 'items#remove'

end
