#!/usr/bin/env ruby

# Check if a single argument is provided
if ARGV.length != 1
  puts "Usage: #{__FILE__} <string>"
  exit(1)
end

# Regular expression pattern to match only capital letters
pattern = /[A-Z]/

# Get the input string from the command-line argument
input_string = ARGV[0]

# Match and concatenate the capital letters in the input string
result = input_string.scan(pattern).join

# Print the result if it contains capital letters
if result.length > 0
  puts result
end
