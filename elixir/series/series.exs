defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    if String.length(s) < size or size <= 0 do
      []
    else
      for n <- 0..(String.length(s) - size), do: String.slice(s, n, size)
    end
  end
end

