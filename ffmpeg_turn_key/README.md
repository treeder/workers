### Turn key ffmpeg worker
---

This is full functional demo of video processing worker.
You need http://iron.io/ account to use it.

### Instructions

1. Set up amazon s3 credentials. Insert real access_key and secret_key into `ffmpeg_turn_key.config.yml`
1. Upload worker: `iron_worker upload --worker-config ffmpeg_turn_key.config.yml ffmpeg_turn_key`
1. Use it!

Command-line example - launch worker, wait for finish and print log:
```sh
$ iron_worker queue ffmpeg_turn_key -p '{
  "bucket":"turn_key_worker_test",
  "store_name":"iron_man.mp4",
  "video_url":"https://s3.amazonaws.com/iron-examples/video/iron_man_2_trailer_official.flv"
}' --wait
```

