defmodule Reset do
     def zero_price(offer) do   
        offer = Map.put(offer, :total, "#")
        offer = Map.put(offer, :net_total, "#")
        items = Enum.map(offer[:items], fn (el) -> zero_price_in_item(el) end)          
        offer = Map.put(offer, :items, items)
        offer 
     end

     defp zero_price_in_item(el) do 
        el = el |> Map.put( :net_total, "#") |> Map.put( :total, "#") 
        el  
     end

    def get_data_price_to_check(offer) do
        table = Enum.map(offer[:items], fn (el) -> {el[:net_total], el[:total]} end)  
        table = [{offer[:net_total], offer[:total]} | table]
        table
    end
end