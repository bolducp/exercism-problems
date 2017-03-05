defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    if String.length(string) == 0 do
      ""
    else
      leading = String.at(string, 0)
      trimmed = String.trim_leading(string, leading)
      num_start = String.length(string) - String.length(trimmed)
      if num_start == 1 do
        first = leading
      else 
        first = Integer.to_string(num_start) <> leading
      end
      first <> encode(trimmed)
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    if String.length(string) == 0 do
      ""
    else
      full = String.replace(string, ~r/(?<!\d)([A-Z])/, "1\\1")
      nums = String.split(full, ~r/[A-Z]/, trim: true)
      lets = String.split(full, ~r/\d*/, trim: true)
      
      reconstruct(nums, lets)
    end
  end

  def reconstruct(nums, lets) do
    if length(nums) == 0 do
      ""
    else
      String.duplicate(hd(lets), String.to_integer(hd(nums))) <> reconstruct(tl(nums), tl(lets))
    end

  end
end
