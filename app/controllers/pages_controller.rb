class PagesController < ApplicationController
    def home
    end
    def about
        render template: "/pages/about.html.erb"
    def team
    end

    def account
    end
end