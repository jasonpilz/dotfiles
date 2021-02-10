require 'json'
require 'csv'
require 'awesome_print'

Pry.config.history.should_save = true
Pry.config.history.should_load = true
Pry.config.theme = 'solarized'
Pry.config.editor = 'vim'
Pry.history.load

Pry.prompt = [
  proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > "  },
  proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * "  }
]

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Monkeypatches for playing around
class Array
  def self.toy(n = 10, &block)
    block_given? ? Array.new(n, &block) : Array.new(n) { |i| i + 1 }
  end
end

class Hash
  def self.toy(n = 10)
    Hash[Array.toy(n).zip(Array.toy(n) { |c| (96+(c+1)).chr })]
  end
end
