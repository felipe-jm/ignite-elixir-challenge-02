defmodule ListFilter do
  require Integer

  def call(list), do: even_numbers_count(list)

  def even_numbers_count(list) do
    numbers = get_numbers(list)
    even_numbers = Enum.filter(numbers, fn number -> Integer.is_odd(number) end)
    length(even_numbers)
  end

  def get_numbers(list) do
    numbers = Enum.filter(list, fn elem -> is_a_number(Integer.parse(elem)) end)
    string_list_to_integer(numbers)
  end

  def is_a_number({number, _binary}), do: number
  def is_a_number(:error), do: false

  def string_list_to_integer(list) do
    Enum.map(list, fn elem ->
        {number, _binary} = Integer.parse(elem)
        number
      end
    )
  end
end
