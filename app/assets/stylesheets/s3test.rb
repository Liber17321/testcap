s3 = AWS::S3.new(
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])

bucket = s3.buckets.create('my-bucket')

# makes no request, returns an AWS::S3::S3Object
obj = bucket.objects['key']

# streaming upload a file to S3
obj.write(Pathname.new('/path/to/file.txt'))

# enumerate ALL objects in the bucket (even if the bucket contains
# more than 1k objects)
bucket.objects.each do |obj|
  puts obj.key
end

# enumerate at most 20 objects with the given prefix
bucket.objects.with_prefix('photos/').each(:limit => 20) do |photo|
  puts photo.key
end
