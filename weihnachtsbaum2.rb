#!/usr/bin/ruby

require 'highline'

class ChristmasTree
  def initialize(width, height, prompt=true)
    numberOfCrownSpaces = (width-1)/2
    numberOfNeedles = 1
    if height < (width+1)/2
      numberOfCrownLines = height
      numberOfTrunkLines = 0
    else
      numberOfCrownLines = (width+1)/2
      numberOfTrunkLines = height - numberOfCrownLines
    end
    numberOfTrunkSpaces = numberOfCrownSpaces - 1
    numberOfCrownLines -= 1 if prompt
    #leave place for the following prompt, if so desired

    @stringRepresentation = ""

    numberOfCrownLines.times do
      @stringRepresentation += (' ' * numberOfCrownSpaces) + ('*' * numberOfNeedles) + "\n"
      numberOfCrownSpaces -= 1
      numberOfNeedles += 2
    end

    numberOfTrunkLines.times do
      @stringRepresentation += (' ' * numberOfTrunkSpaces) + '| |' + "\n"
    end
  end

  def to_s
    @stringRepresentation
  end
end


puts "Do you want an [o]ff-the-shelf tree or a [c]ustom one?"
choice = gets.chomp
if choice != "c" then
  dims = HighLine::SystemExtensions.terminal_size
  width = dims[0]
  height = dims[1]
  numberOfTrees = 1
else
  puts "How wide should it be?"
  width = gets.chomp.to_i
  puts "How tall should it be?"
  height = gets.chomp.to_i
end

yourTree = ChristmasTree.new(width, height)

puts yourTree
