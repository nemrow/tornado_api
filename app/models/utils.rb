class Utils
  def self.create_checksum(content)
    Digest::MD5.hexdigest(content)[0,16]
  end
end
