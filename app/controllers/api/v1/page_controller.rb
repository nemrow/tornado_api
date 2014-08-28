module Api
  module V1
    class PageController < ApplicationController
      def show
        page = Page.find_by_url(params[:url])
        if page
          changes = page.changes
        else
          change = []
        end
        render :json => changes
      end
    end
  end
end
