require 'socket'

# Connect to socket.
host = 'localhost'
port = 11113
socket = TCPSocket.new(host, port)

equation_prefix = 'Equation: '.freeze
header_end_line = ('-' * 80).freeze
reading_header = true

# Read lines from socket.
while line = socket.gets
  line.chomp!
  puts "\n#{line}"

  # End of challenge header?
  if line == header_end_line
    reading_header = false
    next
  end

  # Skip while reading header or not an equation.
  next if reading_header || !line.include?(equation_prefix)

  # Challenge.
  # Parse challenge and sanitize input.
  equation = line.sub('Equation: ', '').gsub(/[^\s\d\+-\\\*]/, '')
  # Evaluate the answer.
  answer = eval(equation)
  # Print answer.
  puts answer
  # Send answer to server.
  socket.puts answer
end

socket.close
