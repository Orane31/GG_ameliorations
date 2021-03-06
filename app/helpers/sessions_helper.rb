module SessionsHelper
    def current_user
        User.find_by(id: session[:user_id])
      end
    
      def log_in(user)
        session[:user_id] = user.id
      end

      def logged_in?
        if session[:user_id] == nil
            false
        else
            true
        end
      end

      def from_you?(id)
        if current_user.id == id
          return true
        else
          return 
        end
      end



end
