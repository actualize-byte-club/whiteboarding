# Write a function that takes in an array of numbers and returns the largest number.

# Clarify
# Example input: array of numbers => [1, 5, 3, 34, 0, 23]
# Expected output: single number => 34

# Visualize
# make a function or method that takes in an array of numbers as an argument
# create a variable to store the first item in the array
# loop through the array using an each loop
# compare the variable with each item in the array
# if our variable is smaller, set the item as the value of the variable
# return the variable at the end of looping

# def largest_num(numbers)
#   largest = numbers[0] #1
#   numbers.each do |number|
#     if largest < number
#       largest = number
#     end
#   end
#   largest
# end

# puts largest_num([1, 5, 3, 34, 0, 23, 5])


# Write a function that reverses a string
# Write a function that prints out each letter in a string

# Clarify
# Example input: "Hello World!" => string
# Expected output: "!dlroW olleH" => string

# Visualize
# Convert string into array of characters using the split method
# Loop through each item in array and print it


def reverse(string)
  reversed = ""
  string.each_char { |char| reversed.insert(0, char)}
  reversed
end

p reverse("Hello World!")