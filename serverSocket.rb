require 'socket'

Port = 7777
Queue_Size = 7
Buffer_Size = 1024

def parse_calc(msg)
	comp = msg.split
	return comp
end

def calculator(operation)
	first = operation[0].to_i
	sec = operation[1].to_i
	operator = operation[2]

	if operator == '+'
		return first + sec
	elsif operator == '-'
		return first - sec
	elsif operator == '*'
		return first * sec
	elsif operator == '/'
		return first / sec
	else 'Wait, what\'s that?'
	end
end

print 'Port: ', Port
puts ''
server = TCPServer.open(Port)

loop do
	client = server.accept
	msg = client.recv(Buffer_Size)
	print 'Message received: ', msg
	puts ''
	operation = parse_calc(msg)
	result = calculator(operation).to_s
	client.send(result, 0)
	client.close
end