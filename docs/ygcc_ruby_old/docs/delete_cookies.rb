require 'fileutils'
class Cookies
  def delete(dir= "C:\Documents and Settings\#{ENV['USERNAME']}\Cookies")
    # or wherever your cookies are downloaded to (can be browser specific)
    FileUtils.rm_rf dir
  end
end