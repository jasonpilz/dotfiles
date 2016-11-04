require 'awesome_print'
require 'hashie'
require 'prawn'
require 'faker'
require 'json'
require 'csv'

Pry.config.theme = 'solarized'
Pry.config.editor = 'vim'

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

AwesomePrint.pry!
