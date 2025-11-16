 
defmodule Example do
   def get_example_1() do
        %{
            :net_total => 100,
            :tax => 20, 
            :total => 120,
            :items => [
                %{
                :net_price => 50,
                :quantity => 1,
                :net_total => 50,
                :total => 60
                },
                %{
                :net_price => 25,
                :quantity => 2,
                :net_total => 50,
                :total => 60
                }           
            ]
        }
    end

    def get_example_2() do
       %{
         :net_total => 200,
         :tax => 10, 
         :total => 220,
         :items => [
             %{
               :net_price => 10,
               :quantity => 5,
               :net_total => 50,
               :total => 55
             },
             %{
               :net_price => 25,
               :quantity => 6,
               :net_total => 150,
               :total => 165
             }             
         ]
      }   
    end

    def get_example_3() do
        %{
            :net_total => 450,
            :tax => 10, 
            :total => 495,
            :items => [
                %{
                :net_price => 10,
                :quantity => 10,
                :net_total => 100,
                :total => 110
                },
                %{
                :net_price => 10,
                :quantity => 20,
                :net_total => 200,
                :total => 220
                },             
                %{
                :net_price => 25,
                :quantity => 6,
                :net_total => 150,
                :total => 165
                }          
            ]
        }    
    end          
end
      
 