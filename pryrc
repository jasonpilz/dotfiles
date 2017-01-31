require 'json'
require 'awesome_print'
require 'csv'

Pry.config.history.should_save = true
Pry.config.history.should_load = true
Pry.config.theme = 'solarized'
Pry.config.editor = 'vim'
Pry.history.load

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Monkeypatches for playing around
class Array
  def self.toy
    [1, 2, 3] + %w(a b c)
  end
end

class Hash
  def self.toy
    {
      1      => 2,
      'a'    => 'b',
      'foo'  => 'bar',
      :hello => 'world'
    }
  end
end

/* AwesomePrint.pry! */
