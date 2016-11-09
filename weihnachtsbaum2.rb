#!/usr/bin/ruby

class ChristmasTree
  def initialize(width, height, prompt=true)
    @numberOfCrownSpaces = (width-1)/2
    @numberOfNeedles = 1
    @numberOfCrownLines = height < (width+1)/2 ? height : (width+1)/2
    @numberOfTrunkLines = @numberOfCrownLines < height ? height - @numberOfCrownLines : 0
    @numberOfTrunkSpaces = @numberOfCrownSpaces - 1
    @numberOfCrownLines -= prompt ? 1 : 0
    #leave place for the following prompt, if so desired
  end

  def print
    @numberOfCrownLines.times do
      puts (' ' * @numberOfCrownSpaces) + ('*' * @numberOfNeedles)
      @numberOfCrownSpaces -= 1
      @numberOfNeedles += 2
    end

    @numberOfTrunkLines.times do
      puts (' ' * @numberOfTrunkSpaces) + '| |'
    end
  end
end

require 'highline'

dims = HighLine::SystemExtensions.terminal_size

width = dims[0]
height = dims[1]

myTree = ChristmasTree.new(width, height)
myTree.print
