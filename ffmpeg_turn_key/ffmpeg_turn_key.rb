# Prepare environment
ENV['PATH'] = File.expand_path('./bin', File.dirname(__FILE__)) + ":" + ENV['PATH']
`chmod +x bin/*`
require 'aws/s3'

# Input data
bucket = params[:bucket] || raise("Please set up bucket")
store_name = params[:store_name] || raise("Please set up store_name")
encoding_options = params[:encoding_options] || "-c:v libx264 -preset medium -crf 22 -c:a copy"
in_file = params[:video_url] || raise("Please set up video_url")
out_ext = params[:out_format] || 'mp4'

# Check config status
config[:amazon][:access_key] || raise("please set up amazon/access_key")
config[:amazon][:secret_key] || raise("please set up amazon/secret_key")

# Download input video file
`mkdir -p data`
`curl "#{in_file}" 2>/dev/null > data/input.flv`
out_file = "data/output.#{out_ext}"

# Print ffmpeg version
puts `ffmpeg -version`

# Convert!
puts '*'*80
puts `ffmpeg -i data/input.flv -loglevel error #{encoding_options} #{out_file}`
puts '*'*80

puts "Converted video size: #{File.size(out_file)} Bytes"

# Upload!
AWS::S3::Base.establish_connection!(
  access_key_id: config[:amazon][:access_key],
  secret_access_key: config[:amazon][:secret_key]
)

puts AWS::S3::S3Object.store(store_name, open(out_file), bucket)

puts "Movie url:"
puts AWS::S3::S3Object.url_for(store_name, bucket, expires:  Time.mktime(2038, 1, 18).to_i)

# Video uploaded, notify parent
# Implement me