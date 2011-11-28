#!/usr/bin/env ruby

if ARGV.size < 1
  puts <<EOF
Usage:
  ruby test.rb $server [$port] 

  $server: IP address or dns name of deploy server.
  $port  : Port number of deploy server. The default value is 3000.
EOF

  exit 1 
end

port = 3000
if ARGV.size >= 2
  port = ARGV[1]
end

cmd = "ruby #{File.dirname(__FILE__)}/cli.rb #{ARGV[0]} --port #{port}"

#software
puts `#{cmd} software list`
puts `#{cmd} software list --verbose`

#component
puts `#{cmd} component list`
puts `#{cmd} component list --verbose`

#node
puts `#{cmd} node list`
puts `#{cmd} node list --verbose`

puts `#{cmd} node_candidate list`
puts `#{cmd} node_candidate list --verbose`

#proposal
puts `#{cmd} proposal list`
puts `#{cmd} proposal list --verbose`

