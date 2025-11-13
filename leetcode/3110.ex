defmodule Solution do
  @spec recur(cs :: [String.t], acc :: integer) :: integer
  def recur(cs, acc) do
    if length(cs) < 2 do
      acc
    else
      recur(Enum.drop(cs, 1), acc + abs(Enum.at(cs, 0) - Enum.at(cs, 1)))
    end
  end

  @spec score_of_string(s :: String.t) :: integer
  def score_of_string(s) do
    recur(String.to_charlist(s), 0)
  end
end
