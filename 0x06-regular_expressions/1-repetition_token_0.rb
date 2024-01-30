#!/usr/bin/env ruby

# Check if a single argument is provided
if ARGV.length != 1
  puts "Usage: #{__FILE__} <string>"
  exit(1)
end

# Regular expression pattern to match the test string
pattern = /hbt{2,5}n/

# Get the input string from the command-line argument
input_string = ARGV[0]

# Match the input string against the pattern
if input_string.match?(pattern)
  puts input_string
end
