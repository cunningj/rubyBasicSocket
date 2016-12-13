#!/usr/bin/ruby

require 'socket'

# 1. Reads 1024 bytes from /dev/urandom

def getOneKb
  # copy stream used with 1024 byte limit as last param
  IO.copy_stream('/dev/urandom', ARGV[0], 1024)
end

getOneKb

# 2. Cleans out all non UTF-8 compliant chars
# 3. Replaces all spaces with *

def filterUtf
  file = File.open(ARGV[0], "rb")
  # set file as 1 string to str
  str = file.read
  str2 = str.gsub!(/\s/,'*') # space replacement
    # write output to new file
    File.open(ARGV[1], 'w') do |output|
      # uses encode method to force utf8 output
      output.write(str2.encode("UTF-8", invalid: :replace, undef: :replace, :replace => ""))
    end
end

filterUtf

# 4. Sends this data to a server via TCPSocket

def connect
  file = File.open(ARGV[1], "rb")
  data = file.read
  sock = TCPSocket.open('localhost', 3000)
  # send the utf8 file data to the server
  sock.write(data)
  response = sock.gets
  # output server response to client STDOUT
  puts response
  sock.close
end

connect
