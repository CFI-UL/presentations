require 'socket'

FLAG = 'FLAG-93729647adbbe0e9dd7a55d4225acbc7'.freeze
PORT = ENV['PORT'] || 2000
NUMBER_EQUATIONS = ENV['NUMBER_EQUATIONS'] || 200

CHALLENGE_HEADER = %(
---------------------------- Programming Challenge ----------------------------
For this challenge you need to send the answer of an #{NUMBER_EQUATIONS} arithmetique equations.
Example for the given equation, the expected answer is "101".
Equation: 200 / -50 + 5 + 100
--------------------------------------------------------------------------------
).freeze

def generate_problem(numbers = 5, max = 100)
  range = (1..max)
  prng = Random.new
  operations = %i[+ - / *]
  number = prng.rand(range)
  equation = [number]
  numbers.times do
    equation << operations.sample
    equation << prng.rand(range)
  end
  equation = equation.join(' ')
  { equation: equation, answer: eval(equation) }
end

begin
  puts 'Starting server.'
  server = TCPServer.new PORT
  loop do
    # Create a new Process per client.
    Thread.fork(server.accept) do |client|
      puts 'New client connected.'
      client.puts CHALLENGE_HEADER
      begin
        correct_answer = 0
        NUMBER_EQUATIONS.times do |i|
          problem = generate_problem(5 + i, 100 * i + 100)
          client.puts "Equation: #{problem[:equation]}"
          answer = client.gets.to_s.chomp
          if answer == problem[:answer].to_s
            correct_answer += 1
          else
            client.puts 'Bad answer!'
            break
          end
        end
        if correct_answer == NUMBER_EQUATIONS
          client.puts "Good job! Here is the flag #{FLAG}."
        end
        client.close
      rescue Errno::EPIPE
        client.close
      end
    end
  end
rescue SystemExit, Interrupt
  puts 'Closing server.'
  server.close
end
