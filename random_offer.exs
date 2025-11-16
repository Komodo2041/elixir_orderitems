 
defmodule Random do

    @nr_items 10
    @max_tax 30
    @max_qty 10
    @min_price 5
    @max_price 100

    def get_random() do 
        tax = Enum.random(0..@max_tax)      
        items = for _ <- 1..Enum.random(1..@nr_items), do: create_item(tax)
        price_netto = Enum.reduce( items, 0, fn (el, acc) -> acc +  Map.get(el, :net_total) end)
        price_total = Enum.reduce( items, 0, fn (el, acc) -> acc +  Map.get(el, :total) end)         
        %{ :net_total => price_netto, :tax => tax,  :total =>  price_total, :items => items}

    end

    defp create_item(tax) do
       qty = Enum.random(1..@max_qty)
       price = Enum.random(@min_price..@max_price)
       total = qty *  price
       price_brutto = round(total * (1 + tax/100))  
       %{ :net_price => price, :quantity => qty, :net_total => total, :total => price_brutto}
    end
end