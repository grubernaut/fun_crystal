# Currency Converter

# Create a global hash of known currencies and rate to USD
# Instead of defining rates for each currency to the other,
# set exchange rate to/from USD, cause murica. Then can move from
# USD to any other currency with known rate. Rates are as of
# 08.07.15

# From USD to $key
$currencies = {
  "USD" => 1,
  "CAD" => 1.31184,
  "EUR" => 0.91888,
  "JPY" => 124.89420,
  "GBP" => 0.64582
}

# Print Help Method
def print_help
  puts "Usage: currency <float> <from_rate> <to_rate>"
  puts "Only accepts one of the following ISO4217 Codes:"
  $currencies.each do |k,v|
    puts k
  end
  exit(1)
end

# Call print_help if args aren't correct
print_help unless ARGV.length == 3

# Get money wanting to convert with precision of 2. Cause money.
c_money = ARGV[0].to_f32.round(2)

# Get current currency, and transfer currency. Completely safe to upcase a possible int
# all args are strings, until cast differently
c_currency, t_currency = ARGV[1].upcase, ARGV[2].upcase

# Print help if currency is invalid
print_help unless $currencies.has_key?(c_currency) && $currencies.has_key?(t_currency)

# Convert Money into USD
usd_money = (c_money / $currencies[c_currency]).to_f32.round(2)

# Convert Money into Desired Currency from USD
new_money = (usd_money * $currencies[t_currency]).to_f32.round(2)

# Print the amazing compute from this super simple code
puts "#{c_money} #{c_currency} = #{new_money} #{t_currency}"
