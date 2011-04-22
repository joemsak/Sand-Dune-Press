module NavigationHelpers
  module Refinery
    module Comics
      def path_to(page_name)
        case page_name
        when /the list of comics/
          admin_comics_path

         when /the new comic form/
          new_admin_comic_path
        else
          nil
        end
      end
    end
  end
end
