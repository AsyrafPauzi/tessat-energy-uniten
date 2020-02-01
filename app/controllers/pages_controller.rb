class PagesController < ApplicationController
    before_action :authenticate_user!

    def home
    end

    def map
    end

    def application_training
    end

    def about_us
    end

end
