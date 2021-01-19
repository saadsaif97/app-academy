# Write a method, grid(n, m), that accepts two numbers as args.
# The method should return a 2D array with n rows and m columns (this means that there are n subarrays, each of length m).

# def grid(n, m)
#     Array.new(m) {Array.new(n)}
# end

# result_1 = grid(2, 3)
# p result_1              # => [[nil, nil, nil], [nil, nil, nil]]
# result_1[0][0] = "X"
# p result_1              # => [["X", nil, nil], [nil, nil, nil]]


# result_2 = grid(4, 2)
# p result_2              # => [[nil, nil], [nil, nil], [nil, nil], [nil, nil]]
# result_2[0][0] = "Q"
# p result_2              # => [["Q", nil], [nil, nil], [nil, nil], [nil, nil]]


def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue
  # do stuff to rescue the "arguments must be strings" exception...
  puts "there was an exception :("
end