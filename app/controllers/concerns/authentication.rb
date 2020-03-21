require 'active_support/concern'

module Authentication
  extend ActiveSupport::Concern

  # Copied from https://github.com/wardencommunity/rails_warden/blob/master/lib/rails_warden/authentication.rb
  # as include does not work somehow

  def warden
    request.env['warden']
  end

  # Proxy to the authenticated? method on warden
  # :api: public
  def authenticated?(*args)
    warden.authenticated?(*args)
  end

  # Access the currently logged in user
  # :api: public
  def current_user(*args)
    warden.user(*args)
  end

  def authorize!(record)
    unless record == current_user
      #redirect to show
      redirect_to record, alert: t('messages.user.not_authorized')
    end
  end

  def login!(user, scope: :default)
    warden.set_user(user, scope: scope)
  end

  # Logout the current user
  # :api: public
  def logout!(scope: nil)
    if scope
      warden.logout(scope)
      warden.clear_strategies_cache!(scope: scope)
    else
      warden.logout
      warden.clear_strategies_cache!
    end
  end

  # Proxy to the authenticate method on warden
  # :api: public
  def authenticate(*args)
    warden.authenticate(*args)
  end

  # Proxy to the authenticate method on warden
  # :api: public
  def authenticate!(*args)
    defaults = {action: RailsWarden.unauthenticated_action}
    if args.last.is_a? Hash
      args[-1] = defaults.merge(args.last)
    else
      args << defaults
    end
    warden.authenticate!(*args)
  end
end