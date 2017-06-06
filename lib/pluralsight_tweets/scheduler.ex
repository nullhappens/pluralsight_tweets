defmodule PluralsightTweets.Scheduler do
  def scheudule_file(schedule, file) do
    Quantum.add_job(schedule, fn ->
      IO.puts PluralsightTweets.FileReader.get_strings_to_tweet(file)
    end)
  end
end
