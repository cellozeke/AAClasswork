class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def check_logged_in?
        redirect_to cats_url if logged_in?
    end
end
