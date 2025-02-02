# Vikasietum Pizza Assignment

## How To Use

Open a rails console and execute below commands

```
bundle exec rails c
order_details_1 = {:pizzas=>[{:name=>"Chicken Tikka", :size=>"large", :crust=>"Cheese Burst", :toppings=>["Chicken Tikka", "Mushroom"]}], :sides=>["Cold Drink"]}
pf = PizzaFactory.new
pf.place_order(order_details_1)
order_details_2 = {:pizzas=>[{:name=>"Chicken Tikka", :size=>"large", :crust=>"Cheese Burst", :toppings=>["Chicken Tikka", "Mushroom"]}], :sides=>["Cold Drink"]}
pf.place_order(order_details_2)
```shell