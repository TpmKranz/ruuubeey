#!/usr/bin/ruby

require 'highline'

dims = HighLine::SystemExtensions.terminal_size

lines = dims[1] - 1
#subtract one line for the prompt

middle = dims[0] / 2

width = middle * 2 - 1
#make width an odd number

line = ' ' * width

lines.times do |i|
  if i < middle
    line[middle-i] = '*'
    line[middle+i] = '*'
    puts line
  else
    puts (' ' * (middle - 1))+'| |'+(' ' * (middle - 1))
  end
end
