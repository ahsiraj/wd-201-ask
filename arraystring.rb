=begin
 Problem 1. Given a nested array of first names and last names, return a new array with the full names.

  names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
  # fill in code that will return a new array of the full names:
  #   ["Jhumpa Lahiri", "J.K Rowling", ...]
=end
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
fullnames = names.map { |x| x.join(" ") }

puts names
puts "-----"
puts fullnames

=begin
Problem 2. Given two arrays books and authors, merge them and print who wrote which book.

  books = ["Design as Art", "Anathem", "Shogun"]
  authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
  # fill in code that will print:
  #   Design As Art was written by Bruno Munari
  #   Anathem was written by Neal Stephenson
  #   ...
=end

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

#This
for i in 0..books.length - 1
  puts books[i] + " was written by " + authors[i]
end
#or this
books.each_with_index do |value, index| puts (value + " was written by " + authors[index]) end

=begin
Problem 3. Print the given list of todos by category. (You haven't learned Hashes yet, so use only arrays.)

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

# Fill in code that will print:
#   money:
#     Send invoice
#     Pay rent
#     Pay taxes
#   organize:
#     Clean room
#     Arrange books
#   food:
#     Buy groceries

Hints:

    You should first build an array just for categories which looks like this: [["money", ["Send invoice", "Pay rent"]], ...]

    When you find something from an array and it doesn't exist, then Ruby will return nil. You can check if something is nil like this:

nums = [1,2,3]
large_number = nums.find {|i| i > 10}
if large_number == nil
  puts "No large numbers!"
else
  puts large_number
end
=end

=begin
x = 1
if x > 2
   puts "x is greater than 2"
elsif x <= 2 and x!=0
   puts "x is 1"
else
   puts "I can't guess the number"
end

=end

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

todos_sorted = todos.sort_by { |activity| [activity[1]] }

category = ""

todos_sorted.each { |activity|
  if activity[1] != category
    puts activity[1] + ":\n"
    category = activity[1]
  end
  puts "\t" + activity[0]
}

puts "------------------------------------ To symbol ------------------------"

=begin
Problem 1. Given two arrays books and authors, merge them into a single Hash. The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.

  books = ["Design as Art", "Anathem", "Shogun"]
  authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
  # fill in code that will create a Hash that looks like:
  #   {
  #     :bruno => "Design as Art",
  #     :neal => "Anathem",
  #     ...
  #   }

Hint: To convert a string into a symbol, use the .to_sym method
=end
