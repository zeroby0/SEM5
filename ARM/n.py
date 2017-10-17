ch = 0.0
incr = 1
time = 1;

for i in range(25):
  if(ch > 0.9): incr = -1
  if(ch < 0.1): incr = +1
  print time*ch
  # turn on LED here
  # sleep for time * ch
  # off
  # sleep for time * ( 1 - ch)
  ch = ch + 0.1*incr
  


