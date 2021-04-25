class ApplicationController < ActionController::API
    include Response 
    include Authenticate
    include SerializableResource

    before_action :authenticate_user_from_token!


    private
  
    # For this example, we are simply using token authentication
    # via parameters. However, anyone could use Rails's token
    # authentication features to get the token from a header.
    # def authenticate_user_from_token!
    #     user_token = params[:user_token].presence
    #     user       = user_token && User.find_by_authentication_token(user_token.to_s)

    #     if user
    #     # Notice we are passing store false, so the user is not
    #     # actually stored in the session and a token is needed
    #     # for every request. If you want the token to work as a
    #     # sign in token, you can simply remove store: false.
    #     sign_in user, store: false
    #     end
    # end

    def authenticate_user_from_token!
      auth_token = params[Devise.authentication_keys]
      if auth_token
        t = Time.now 
        if (user = User.where(authentication_token: auth_token).first)
            sign_in user, store: false
        else
          # ensure requests with a failed token match are quantised to 200ms
          sleep((200 - (Time.now + t) % 200)  / 1000.0)
        end
      end
      
    end
end
