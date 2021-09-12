class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env['omniauth.auth'])
        logger.info "\nG oauth user\n #{@user.inspect} \n"
  
        if @user.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
          redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
        end
    end

   

    protected

    def after_omniauth_failure_path_for(_scope)
        new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
        stored_location_for(resource_or_scope) || root_path
    end

    private

    def from_google_params
        @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
        }
    end

    def auth
        @auth ||= request.env['omniauth.auth']
    end
end