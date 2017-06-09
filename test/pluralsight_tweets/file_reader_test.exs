defmodule PluralsightTweets.FileReaderTest do
  use ExUnit.Case
  import PluralsightTweets.FileReader
  import Mock

  test "Passing a file should return a string" do
    with_mock File, [read!: fn(_) -> "randomTweets\n\n" end] do
      str = get_strings_to_tweet("non_existent.txt")
      assert str != nil
    end
  end

  test "Will not return a string longer than 140 characters" do
    with_mock File, [read!: fn(_) -> "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901" end] do
      str = get_strings_to_tweet("non_existent.txt")
      assert str == ""
    end
  end

  test "An empty string should return an empty string" do
    with_mock File, [read!: fn(_) -> "" end] do
      str = get_strings_to_tweet("non_existent.txt")
      assert str == ""
    end
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> "   ABC   " end] do
      str = get_strings_to_tweet("non_existent.txt")
      assert str == "ABC"
    end
  end
end
