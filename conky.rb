require 'open3'

RX = /^([a-zA-Z]{3}) ([0-9]{2}:[0-9]{2}) ([a-zA-Z]+)$/

def tc(header, dest)
  header_padded = '%-4.4s' % "#{header}:"

  cmd = "time-conv -o '%a %H:%M %Z' -d #{dest}"
  result = `#{cmd}`

  c = result.match(RX).captures

  day = c[0]
  time = c[1]
  tz = '%-4.4s' % c[2]

  "#{header_padded} #{day} #{time} #{tz}"
end

header = ARGV[0]
dest = ARGV[1]

puts tc(header, dest)
