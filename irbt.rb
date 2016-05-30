# coding: utf-8
# An IRB + mystiko test bed

require 'irb'
$force_alias_read_line_module = true
require 'mini_readline'

puts "Starting an IRB console with mystiko loaded."

if ARGV[0] == 'local'
  require_relative 'lib/mystiko'
  puts "mystiko loaded locally: #{Mystiko::VERSION}"

  ARGV.shift
else
  require 'mystiko'
  puts "mystiko loaded from gem: #{Mystiko::VERSION}"
end

IRB.start
