defmodule Solution do
  @spec can_alice_win(nums :: [integer]) :: boolean
  def can_alice_win(nums) do
    Enum.reduce(nums, 0, fn n, acc ->
      acc + if n < 10, do: n, else: -n
    end) != 0
  end
end
