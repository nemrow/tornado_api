class AwsHelper
  def self.write_to_aws(file_path, temp_file)
    s3 = AWS::S3.new(
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    )
    s3.buckets['the_tornado'].objects["#{file_path}"].write(
      :file => temp_file.path,
      :acl => :public_read
    )
  end
end
