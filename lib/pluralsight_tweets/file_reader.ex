defmodule PluralsightTweets.FileReader do
  @doc """
  This function will take the path to a faile and find a string that can be
  tweeted out.

  It will trim all the strings, and then eliminate any characters that are
  larger than 140 characters but greater than 0 in length.

  iex> PluralsightTweets.FileReader.get_strings_to_tweet("priv/test/doc.txt")
  "ABC"
  """
  def get_strings_to_tweet(path) do
    File.read!(path)
      |> String.split("\n")
      |> Enum.map(&String.trim/1)
      |> Enum.filter(fn str -> String.length(str) > 0
        && String.length(str) <= 140 end)
      |> case do
        [] -> ""
        x -> Enum.random(x)
      end
  end
end
