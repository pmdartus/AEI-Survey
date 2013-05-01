AEI::Application.routes.draw do

  match 'votes/validate/:tocken', :controller => 'votes', :action => 'validate'
  resources :votes
  root :to => 'votes#new'

end
