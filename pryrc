require 'awesome_print'
require 'hashie'
require 'prawn'

Pry.config.theme = 'solarized'
Pry.config.editor = 'vim'

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

AwesomePrint.pry!
