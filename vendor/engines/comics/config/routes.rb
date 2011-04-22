Refinery::Application.routes.draw do
  resources :comics, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :comics, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
