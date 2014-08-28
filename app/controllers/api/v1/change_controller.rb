module Api
  module V1
    class ChangeController < ApplicationController
      def create
        page = Page.find_or_create_by_url(params[:url])
        change = Change.find_or_create_by_page_id_and_selector(page.id, params[:selector])
        if params[:content_type] == "image"
          file_path = "test_images_#{Time.now.to_i}.jpg"
          AwsHelper.write_to_aws(file_path, params[:content].tempfile)
          change.update_attributes(:content => "#{ENV['AWS_BUCKET_PATH']}/#{file_path}", :content_type => "image")
        elsif params[:content_type] == "text"
          change.update_attributes(:content => params[:content], :content_type => "text")
        end
        render :json => page.changes
      end
    end
  end
end
