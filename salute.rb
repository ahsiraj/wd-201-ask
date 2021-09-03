=begin
puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

# write code so the program prints:
#   Hello Mr. Mandela
#   Welcome Mr. Turing
=end

def salute(name, saluteword)
  saluteword.capitalize + " Mr. " + name.split().last
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
