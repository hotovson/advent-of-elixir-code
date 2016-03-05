input = File.read! "lib/inputs/day_01.txt"
IO.puts "To what floor do the instructions take Santa? " <> Integer.to_string(Day01.floor(input))
IO.puts "What is the position of the character that causes Santa to first enter the basement? " <> Integer.to_string(Day01.steps_to_basement(input))

input = File.read! "lib/inputs/day_02.txt"
IO.puts "How many total square feet of wrapping paper should they order? " <> Integer.to_string(Day02.paper_feets(input))
IO.puts "How many total feet of ribbon should they order? " <> Integer.to_string(Day02.ribbon_feets(input))

input = File.read! "lib/inputs/day_03.txt"
IO.puts "How many houses receive at least one present? " <> Integer.to_string(Day03.houses_with_present(input))
IO.puts "This year, how many houses receive at least one present? " <> Integer.to_string(Day03.houses_with_present_with_robo_santa(input))

input = "iwrupvqb"
IO.puts "The lowest positive number for Santa is (5 zeros) " <> Integer.to_string(Day04.crack_secret_key(input))
IO.puts "The lowest positive number for Santa is (6 zeros) " <> Integer.to_string(Day04.crack_secret_key(input, 6))

input = File.read! "lib/inputs/day_05.txt"
IO.puts "How many strings are nice? " <> Integer.to_string(Day05.nice_strings_count(input))
