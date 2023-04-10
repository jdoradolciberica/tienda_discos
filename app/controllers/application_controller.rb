class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    layout :set_layout

    private 
    
    def set_layout
        "guest"
    end

    
end
