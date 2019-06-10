require 'bundler'
Bundler.require


task :run do
  error_count = 0
  pubsub = Google::Cloud::PubSub.new(
    project_id: "pubsub",
  )

  # Retrieve a topic
  topic = pubsub.topic "test"

  subscription = topic.subscription "subscriber"

  subscriber = subscription.listen do |message|
    raise "lol"
  end

  subscriber.on_error do |error|
    error_count += 1
    puts "caught error: #{error}, up to #{error_count} now"
  end

  puts "starting"
  subscriber.start
  sleep
end

task :publish_forever do
  publish_count = 0
  pubsub = Google::Cloud::PubSub.new(
    project_id: "pubsub",
  )

  # Retrieve a topic
  topic = pubsub.topic "test"

  loop do
    publish_count += 1
    topic.publish "new-message"
    puts "published #{publish_count}"
  end
end
