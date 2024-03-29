#!/usr/bin/env ruby

# Check if a single argument is provided
if ARGV.length != 1
  puts "Usage: #{__FILE__} <string>"
  exit(1)
end

# Regular expression pattern to match a string that starts with 'h' and ends with 'n'
pattern = /^h.n$/

# Get the input string from the command-line argument
input_string = ARGV[0]

# Match the input string against the pattern
if input_string.match?(pattern)
  puts input_string
end
