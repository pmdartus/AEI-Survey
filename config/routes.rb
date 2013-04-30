AEI::Application.routes.draw do

  resources :votes
  root :to => 'votes#new'

end
