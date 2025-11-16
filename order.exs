Code.require_file("example_order.exs")
alias Example
Code.require_file("reset_order.exs")
alias Reset
Code.require_file("random_offer.exs")
alias Random

defmodule FillOrder do
    def fill(order) do
        tax = Map.get(order, :tax)
        items = Enum.map(order[:items], fn (el) -> fill_item(el, tax) end) 
        price_netto = Enum.reduce( items, 0, fn (el, acc) -> acc +  Map.get(el, :net_total) end)
        price_total = Enum.reduce( items, 0, fn (el, acc) -> acc +  Map.get(el, :total) end)
        order = order |> Map.put( :total, price_total) |> Map.put( :net_total, price_netto) |> Map.put( :items, items)          
        order
    end

    defp fill_item(item, tax) do
       price =  Map.get(item, :net_price) *  Map.get(item, :quantity)
       price_brutto = round(price * (1 + tax/100))
       item = item |> Map.put( :net_total, price) |> Map.put( :total, price_brutto)
       item 
    end

end

 





example_1 = Example.get_example_1() |> Reset.zero_price()
filled_1 = FillOrder.fill(example_1)
example_check_1 = Reset.get_data_price_to_check(filled_1)

if example_check_1 == Reset.get_data_price_to_check(Example.get_example_1()) do
   IO.puts("PASS 1 data from get_example_1()")
else
   IO.puts("NO PASS 1")
end

example_2 = Example.get_example_2() |> Reset.zero_price()
filled_2 = FillOrder.fill(example_2)
example_check_2 = Reset.get_data_price_to_check(filled_2)

if example_check_2 == Reset.get_data_price_to_check(Example.get_example_2()) do
   IO.puts("PASS 2 data from get_example_3()")
else
   IO.puts("NO PASS 2")
end

example_3 = Example.get_example_3() |> Reset.zero_price()
filled_3 = FillOrder.fill(example_3)
example_check_3 = Reset.get_data_price_to_check(filled_3)

if example_check_3 == Reset.get_data_price_to_check(Example.get_example_3()) do
   IO.puts("PASS 3 data from get_example_3()")
else
   IO.puts("NO PASS 3")
end

if example_check_3 != Reset.get_data_price_to_check(Example.get_example_2()) do
   IO.puts("PASS 4 - test other examples data")
else
   IO.puts("NO PASS 4")
end 

example_2_bad = Reset.get_data_price_to_check(example_3)
IO.inspect(example_2_bad)
if example_2_bad != Reset.get_data_price_to_check(Example.get_example_2()) do
   IO.puts("PASS 5 - test zero data price ")
else
   IO.puts("NO PASS 5")
end 

IO.puts("TEST 2 random ")
random_1 = Random.get_random()
random_1_zero  = random_1 |> Reset.zero_price()
IO.inspect(Reset.get_data_price_to_check(random_1_zero))
filled_1 = FillOrder.fill(random_1_zero)
random_check_1 = Reset.get_data_price_to_check(filled_1)

if random_check_1 == Reset.get_data_price_to_check(random_1) do
   IO.puts("PASS 6 - test random 1 ")
   IO.inspect(random_check_1)
else
   IO.puts("NO PASS 6")
end

IO.puts("TEST 2 random ")
random_2 = Random.get_random()
random_2_zero  = random_2 |> Reset.zero_price()
IO.inspect(Reset.get_data_price_to_check(random_2_zero))
filled_2 = FillOrder.fill(random_2_zero)
random_check_2 = Reset.get_data_price_to_check(filled_2)

if random_check_2 == Reset.get_data_price_to_check(random_2) do
   IO.puts("PASS 7 - test random 2 ")
   IO.inspect(random_check_2)
else
   IO.puts("NO PASS 7")
end

IO.puts("END")
 



 

 