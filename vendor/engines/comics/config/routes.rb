Refinery::Application.routes.draw do
  resources :comics, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :comics, :except => :show do
      collection do
        post :update_positions
      end
    end
    post 'comic/:id/update_comic_page_positions' => 'comic_pages#update_positions', :as => 'update_comic_page_positions'
    post "comic/:id/comic_pages" => 'comic_pages#upload', :as => 'comic_comic_pages_upload'

  end
end
