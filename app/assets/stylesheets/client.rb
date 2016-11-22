require 'aws-sdk'

s3 = Aws::S3::Client.new
# s3.create_bucket(bucket: 'my-bucket')

# The filename name to use with 'upload'
filename = "s3test.rb"
# filename = ARGV[0] if (ARGV.length > 0)
folder_name = "/var/apps/testcap/current/app/assets/stylesheets/"

File.open(filename, 'rb') do |file|
  s3.put_object(
     acl: "public-read",
     bucket: 'mysoftware',
     key: filename, body: filename, cache_control: "public, max-age:31536000",
     content_type: "text/css",
     expires: Time.now+31536000)
end

puts "Uploaded '%s' to S3!" % filename
