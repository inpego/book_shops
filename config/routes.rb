Rails.application.routes.draw do
  namespace :shops do
    get 'books/sold'
  end
  resources :publishers, only: :show
  put 'shops/:shop_id/books/:id/sold/:copies' => 'shops/books#sold'
end
