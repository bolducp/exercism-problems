defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do 
    count(strand, nucleotide, 0) 
  end

  @spec count([char], char, integer) :: non_neg_integer
  def count(strand, nucleotide, num) do 
    if length(strand) > 0 do
    count(tl(strand), nucleotide, if hd(strand) == nucleotide do
                                    num + 1 
                                  else
                                    num
                                  end)
    else
      num
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    for nucleotide <- @nucleotides, into: %{},
      do: {nucleotide, count(strand, nucleotide)}
  end
end
