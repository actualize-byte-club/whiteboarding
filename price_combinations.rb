# Read the menu_items.csv file
# https://www.rubyguides.com/2018/10/parse-csv-ruby/
require "csv"
data = CSV.read("menu_items.csv")
# pp data

# Store the target price from the first row of data
# (strip out spaces and dollar signs from price string and convert to number)
# https://stackoverflow.com/questions/19637677/how-to-delete-specific-characters-from-a-string-in-ruby
target_price = data[0][1]
target_price = target_price.strip.gsub("$", "").to_f
# pp target_price

# Convert the remaining price strings to numbers
menu_items = []
index = 1 # Skip the header row
while index < data.length
  row = data[index]
  name = row[0]
  price = row[1].strip.gsub("$", "").to_f
  menu_items << [name, price]
  index += 1
end
# pp menu_items

# Find the number of the first item that adds up to the target price
name = menu_items[0][0]
price = menu_items[0][1]
quantity = 0
current_total = quantity * price
while current_total < target_price
  quantity += 1
  current_total = quantity * price
end
quantity = quantity - 1 # the loop goes one step too far
current_total = quantity * price
# puts "Target: #{target_price}, Item: #{name}, Quantity: #{quantity}, Total: #{current_total}"

# To avoid decimal issues, store all prices as integer cents
target_price = (target_price * 100).to_i
menu_items = menu_items.map { |menu_item| [menu_item[0], (menu_item[1] * 100).to_i] }
# pp target_price
# pp menu_items

# Instead loop through each item and see if it's price divides into the target price
# If there is no remainder, then it is a valid combination
menu_items.each do |menu_item|
  name = menu_item[0]
  price = menu_item[1]
  if target_price % price == 0
    quantity = target_price / price
    # puts "#{quantity} x #{name} adds up to the target_price"
  end
end

$all_combos = []

def find_combos(menu, target, combo=[])
  # find the sum of the combo array integers (needs the 0 for the first loop iteration since it starts out empty)
  sum = combo.reduce(0, :+)

  # if the sum of the combo array is equal to the target, add the combo array to a global all combos variable (modified to use the menu item names)
  if sum == target
    $all_combos << combo.map {|int| menu.select {|item| int == item[1] }[0][0]}
  end

  # if the sum of the combo array is over target, don't continue (break method)
  return if sum > target

  # call the find_combos method (recursion) on every other item in the remaining menu array, while adding the item's price to the combo array
  menu.each do |item|
    find_combos(menu, target, combo + [item[1]])
  end

end

find_combos(menu_items, target_price)
unique_combos = $all_combos.map { |combo| combo.sort }.uniq
p unique_combos