### Turn key ffmpeg worker

This is full functional demo of video processing worker.

Get an [Iron.io](www.iron.io) account and [create your iron.json file](http://dev.iron.io/worker/reference/configuration/). Then run:

### Instructions

1. Install [cli](http://dev.iron.io/worker/reference/cli/) tool: `gem install iron_worker_ng`
1. Set up amazon s3 credentials. Insert real access_key, secret_key, bucket into `ffmpeg_turn_key.config.yml`
1. Upload worker: `iron_worker upload --worker-config ffmpeg_turn_key.config.yml ffmpeg_turn_key`
1. Use it!

Command-line example - launch worker, wait for finish and print log:
```sh
$ iron_worker queue ffmpeg_turn_key -p '{
  "store_name":"iron_man.mp4",
  "video_url":"https://s3.amazonaws.com/iron-examples/video/iron_man_2_trailer_official.flv"
}' --wait
```

