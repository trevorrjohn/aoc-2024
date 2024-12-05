# uses day1 input files
# File.stream!("day2.test.input")
File.stream!("day2.input")
  |> Enum.map(fn line ->
    String.split(line)
    |> Enum.map(&String.to_integer/1)
  end)
|> Enum.map(fn line ->
    Enum.reduce(line, {nil, nil, []}, fn current, {prev, dir, acc} ->
    case {prev, dir} do
      {nil, nil} -> {current, nil, acc}
      {prev, nil} when current > prev -> {current, :up, acc ++ [current - prev]}
      {prev, nil} when current < prev -> {current, :down, acc ++ [prev - current]}
      {prev, :up} when current > prev -> {current, :up, acc ++ [current - prev]}
      {prev, :down} when current < prev -> {current, :down, acc ++ [prev - current]}
      _ -> {current, dir, acc ++ [-1]} # switched directions
    end
  end)
  |> elem(2)
end)
|> Enum.count(fn diffs ->
  Enum.all?(diffs, fn x -> x > 0 && x <= 3 end)
end)
|> IO.inspect()
