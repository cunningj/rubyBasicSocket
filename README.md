# rubyBasicSocket
Ruby client script that parses UTF8 data and connects to a server script via TCPSocket to send that data

   Make a new directory and add 2 files e.g. target and target2
   Add the client and server scripts to this directory
   Create an additional .log file e.g. var_log_messages.log
   
      a) Change to the new directory with the new files
      b) Take note of your pwd
      c) Ensure all file permissions are correct
      i.e. the 2 new files and the log should be readable and writeable
           the client and server scripts should be executable
           utilize the chmod command if needed
      d) CHANGE THE LOG FILE PATH in the server file to the newly created .log file and
      start the server i.e. ruby serverApp.rb
      e) In another terminal window in the SAME DIRECTORY run the client script
      This will take TWO arguments, the FULL PATH'S of the 2 new target files just created
      e.g. ruby clientApp.rb '/Users/jake/ruby/target' '/Users/jake/ruby/target2'
       NOTE: please ensure the file args HAVE SINGLE QUOTES and contain the FULL PWD
      f) After client is run cat/open the log file to see the data that was sent
