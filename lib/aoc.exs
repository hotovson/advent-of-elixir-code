input = File.read! "lib/inputs/day_01.txt"
IO.puts "To what floor do the instructions take Santa? " <> Integer.to_string(Day01.floor(input))
IO.puts "What is the position of the character that causes Santa to first enter the basement? " <> Integer.to_string(Day01.steps_to_basement(input))
