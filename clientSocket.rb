#Author: Matheus Horst - mhorst31@gmail.com

# This is a very simple calculator using sockets
# Learning purpose only. This was a homework for
# the Computer Networks class at ELTE - Hungary

require 'socket'

Port = 7777
Buffer_Size = 1024


sock = TCPSocket.open('localhost', Port)
puts "Send 2 numbers and a symbol (+ - * or /)"
puts " for a simple calculator using sockets "

msg = STDIN.gets

sock.send(msg, 0)

str = sock.recv(Buffer_Size)
print 'Received: ', str
puts ''
sock.close