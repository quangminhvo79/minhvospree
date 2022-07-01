class Spree::UserSessionsController < Spree::Admin::UserSessionsController

  private
    def resolve_layout
      case action_name
      when "new", "create"
        "layouts/login"
      else
        "spree/layouts/admin"
      end
    end
end
