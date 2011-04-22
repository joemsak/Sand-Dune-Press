module Admin
  class ComicsController < Admin::BaseController

    crudify :comic, :xhr_paging => true

  end
end
