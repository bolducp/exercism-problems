defmodule Bob do
  def hey(input) do
    cond do
      String.length(String.trim(input)) == 0 ->
        "Fine. Be that way!"
      String.ends_with?(input, "?") ->
        "Sure."
      String.upcase(input) == input and String.downcase(input) != input ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end
