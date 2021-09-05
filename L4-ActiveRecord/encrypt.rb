require "aes"

source_file = ARGV[0]
password = AES.key
encrypted = AES.encrypt(File.read(source_file), password)

target_file = "#{source_file}.enc"
File.open(target_file, "wb") { |f| f.write(encrypted) }
puts "File encrypted to #{target_file} with password #{password}"

decrypted = AES.decrypt(File.read(target_file), password)

target_file_new = "#{target_file}.txt"
File.open(target_file_new, "wb") { |f| f.write(decrypted) }
puts "File decrypted back to #{target_file_new}"
