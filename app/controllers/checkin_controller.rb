class CheckinController < ApplicationController
    
    
    
    def index
        ## commented out logged_in for testing purpose
        # if logged_in?
        
        
        # else
        #     redirect_to login_url
        # end
    end
    
    
    # Get the site according to time and user information
    def get_user_school_coordinates
        if logged_in?
            @user = current_user
            # Demo purpose, should have a User method that returns the info

            # @school_coordinates = User.getSchools(@user)
            @school_coordinates = [37.772728,-122.2922217]
        end
    end
end
