Reproduces bug found for ruby pubsub: https://github.com/googleapis/google-cloud-ruby/issues/3413

To run:

```
$ docker-compose up -d pubsub_emulator
$ # wait a few seconds for it actually start because it needs to create the topics
$ docker-compose up consumer
$ # make a new tab
$ docker-compose run consumer rake publish_forever
```

You'll see it fail after around 1k messages erroring in the consumer tab.
