module ApplicationHelper
    def log_in(user)
        #session[:user_id] = user.id
        user.new_token
        cookies.permanent.signed[:user_id] = user.id 
        cookies.permanent[:remember_token] = user.token
        current_user
    end
    def current_user
        if cookies[:user_id]
            @current_user ||= User.find_by(id: cookies[:user_id]) 
        elsif token = cookies[:remember_token]
            set_current_user(User.find_by(remember_digest: token))
        end
    end
    def set_current_user(user)
        @current_user = user
    end
    def sign_out
        cookies.delete(:remember_token)
        cookies.delete(:user_id)
        @current_user = nil
    end
    def logged_in?
        !@current_user.nil?
    end
    def author(user_id)
        user = User.find_by(id: user_id)
        user[:email]
    end
    private 
        def signed_in
            redirect_to signin_url if logged_in?
        end
end
