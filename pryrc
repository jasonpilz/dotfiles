Pry.config.theme = 'solarized'
Pry.config.editor = 'vim'

require 'awesome_print'
AwesomePrint.pry!

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

