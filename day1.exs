# Part 1
File.stream!("day1.input")
|> Enum.map(fn line ->
  String.split(line)
  |> Enum.map(&String.to_integer/1)
end)
|> Enum.zip()
|> Enum.map(&Tuple.to_list/1)
|> Enum.map(&Enum.sort/1)
|> Enum.zip_with(fn [a, b] ->
  abs(a - b)
end)
|> Enum.sum()
|> IO.inspect()

# Part 2
[left, right] = File.stream!("day1.input")
  |> Enum.map(fn line ->
    String.split(line)
    |> Enum.map(&String.to_integer/1)
  end)
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)

frequencies = Enum.frequencies(right)

Enum.map(left, fn x ->
  case Map.has_key?(frequencies, x) do
    true -> x * Map.get(frequencies, x)
    false -> 0
  end
end)
|> Enum.sum()
|> IO.inspect()
