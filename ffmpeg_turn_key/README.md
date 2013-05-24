## Turn key ffmpeg worker

This is full functional demo of video processing worker.

Get an [Iron.io](www.iron.io) account and [create your iron.json file](http://dev.iron.io/worker/reference/configuration/). Then run:

## Instructions

### 1. Add this worker to your account

* Install [cli](http://dev.iron.io/worker/reference/cli/) tool: `gem install iron_worker_ng`
* Set up amazon s3 credentials. Insert real access_key, secret_key, bucket into `ffmpeg_turn_key.config.yml`
* Upload the worker: 

```sh
$ iron_worker upload --worker-config ffmpeg_turn_key.config.yml https://github.com/thousandsofthem/workers/blob/master/ffmpeg_turn_key/ffmpeg_turn_key.worker
```
### 2. Start using it!

You can queue up tasks for it in any language. Check out our  [Client Libraries](http://dev.iron.io/worker/) in the language of your choice to make it easy,
but here's an example using cURL:

```sh
curl -H "Authorization: OAuth TOKEN" -H "Content-Type: application/json" \
-d '{"tasks": [{"code_name": "ffmpeg_turn_key", "payload": "{\"store_name\": \"iron_man.mp4\",\"video_url\":\"https://s3.amazonaws.com/iron-examples/video/iron_man_2_trailer_official.flv\"}"}]}' \
"https://worker-aws-us-east-1.iron.io/2/projects/PROJECT_ID/tasks"
```

Command-line example - launch worker, wait for finish and print log:
```sh
$ iron_worker queue ffmpeg_turn_key -p '{
  "store_name":"iron_man.mp4",
  "video_url":"https://s3.amazonaws.com/iron-examples/video/iron_man_2_trailer_official.flv"
}' --wait
```
