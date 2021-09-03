def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# ..
# ..
# FILL YOUR CODE HERE. Filled!(ask - 4/9/21)
# ..
# ..
#====================================================================================================
def parse_dns(dns_raw) # dns entries from the file are structured here
  dns_array = []
  dns_records = {}
  dns_raw.each { |line| # each line is processed
    if line.strip != "" && !line.strip.start_with?("#") # empty, only space, and comment lines omitted
      #  puts line
      dns_array.push(line.split(",").map(&:strip)) # pushed the dns entries from each line after removing space if any
    end
  }
  #puts dns_array
  #puts "---------------"
  dns_array.each { |type, source, destination| dns_records[source.to_sym] = [type, destination] } #dns source is taken as the key
  #puts dns_records
  dns_records
end

def resolve(dns_records, lookup_chain, domain) #dns resolution
  matched_dns = dns_records[domain.to_sym] # entry in the table
  if matched_dns == nil #no match
    lookup_chain.push("Domain name could not be resolved. Recheck for typos!")
  elsif matched_dns[0] == "A" #IP address match
    lookup_chain.push(matched_dns[1])
  elsif matched_dns[0] == "CNAME"
    lookup_chain.push(matched_dns[1])
    resolve(dns_records, lookup_chain, matched_dns[1]) # recrsive call for CNAME type
  else # entry is there, but type mismatch
    lookup_chain.push(matched_dns[1])
    lookup_chain.push("Could not finish the resolve chain. Something is wrong. Internal entry type mismatch.")
  end
end

#=======================================================================================================
# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
