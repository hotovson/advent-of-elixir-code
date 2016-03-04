input = File.read! "lib/inputs/day_01.txt"
IO.puts "To what floor do the instructions take Santa? " <> Integer.to_string(Day01.floor(input))
IO.puts "What is the position of the character that causes Santa to first enter the basement? " <> Integer.to_string(Day01.steps_to_basement(input))

input = File.read! "lib/inputs/day_02.txt"
IO.puts "How many total square feet of wrapping paper should they order? " <> Integer.to_string(Day02.paper_feets(input))
IO.puts "How many total feet of ribbon should they order? " <> Integer.to_string(Day02.ribbon_feets(input))
