# Take in a single argument, compute the factorial, and print value

# Recursive Factorize Method
def rFactorize(x)
  if x <= 1
    1
  else
    x * rFactorize( x - 1 )
  end
end

# Iterative Factorize Method
def iFactorize(x)
  factor, count  = 1, 0
  while count < x
    count += 1
    factor *= count
  end
  factor
end

# If no args are passed, exit
if ARGV.empty?
  puts "need a number to factorize"
  exit(1)
end

# If more than one argument is passed, exit as well
if ARGV.length > 1
  puts "too many arguments"
  exit(1)
end

# capture argument as an int64
number = ARGV[0].to_i64 unless ARGV.length != 1

# Exit if ARGV wasn't properly parsed
exit(1) unless number

# Factorize that number recursively!
rFactored = rFactorize(number)

# Factorize it iteratively
iFactored = iFactorize(number)

# Print it
puts "Recursive -> #{number}! = #{rFactored}"
puts "Iterative -> #{number}! = #{iFactored}"
