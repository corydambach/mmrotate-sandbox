the server.py implements the following

starts a thread that listens for tcp connections on a specified port
accepts tcp connections on that port
accepts messages through that connection using zeromq 
the messages have the following content\:
  1 a type indicating the type of the message
  2 asdf