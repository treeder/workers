# Prepare environment
ENV['PATH'] = File.expand_path('./bin', File.dirname(__FILE__)) + ":" + ENV['PATH']
`chmod +x bin/*`

# Download input video file
in_file = 'https://s3.amazonaws.com/iron-examples/video/iron_man_2_trailer_official.flv'
`mkdir -p data`
`curl "#{in_file}" > data/input.flv`

# Print ffmpeg version
puts "*"*80
puts `ffmpeg -version`
puts "*"*80

# Convert!
puts `ffmpeg -i data/input.flv -c:v libx264 -preset medium -crf 22 -c:a copy data/output.mp4`

# Show results
puts `ls -la data/`









