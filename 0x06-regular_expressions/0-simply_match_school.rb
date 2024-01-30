#!/usr/bin/env ruby

# The script takes one argument and checks for a match with the word "School"
input_string = ARGV[0]
puts input_string.scan(/School/)
