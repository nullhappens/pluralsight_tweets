defmodule PluralsightTweets.Scheduler do
  def schedule_file(schedule, file) do
    Quantum.add_job(schedule, fn ->
      PluralsightTweets.FileReader.get_strings_to_tweet(file)
      	|> PluralsightTweets.TweetServer.tweet
    end)
  end
end
