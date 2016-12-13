#!/usr/bin/ruby

# 1. Listens for any connections
# 2. Accepts the data from the client app
# 3. Prints the data to a log file

require 'socket'
require 'logger'

# opens file for logging
file = File.open('<YOUR PATH TO LOG FILE>', File::WRONLY | File::APPEND)
logger = Logger.new(file)

server = TCPServer.open(3000)

loop {
  client = server.accept
  logger.info("Client Connected!")
  # respond to client with current time
  client.puts(Time.now.ctime)
  # get the utf8 file data being sent from client
  # writes data to the log file
  logger.info("User-input: %p" % client.gets)
  client.puts "CONENCTION CLOSED"
  client.close
}
