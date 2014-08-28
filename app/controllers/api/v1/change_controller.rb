module Api
  module V1
    class ChangeController < ApplicationController
      def create
        page = Page.find_or_create_by_url(params[:url])
        change = Change.find_or_create_by_page_id_and_selector(page.id, params[:selector])
        change.update_attributes(:content => params[:content], :content_type => params[:content_type])
        render :nothing => true
      end
    end
  end
end
