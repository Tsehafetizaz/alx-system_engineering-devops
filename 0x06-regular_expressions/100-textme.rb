#!/usr/bin/env ruby

# Check if a single argument (log line) is provided
if ARGV.length != 1
  puts "Usage: #{__FILE__} '<log line>'"
  exit(1)
end

# Extract sender, receiver, and flags using regular expressions
log_line = ARGV[0]

sender = log_line.match(/\[from:(.*?)\]/)&.captures&.first
receiver = log_line.match(/\[to:(.*?)\]/)&.captures&.first
flags = log_line.match(/\[flags:(.*?)\]/)&.captures&.first

# Output the formatted result
puts "#{sender},#{receiver},#{flags}"
