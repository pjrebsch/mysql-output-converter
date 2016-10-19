
require 'pathname'

input_path = Pathname.new(
  '/Users/patrickrebsch/Desktop/query_results.txt'
)

# Get original file contents.
fstr = String.new
File.open(input_path.to_s, 'r') { |f| fstr = f.read }

# Replace line dividers with nothing.
fstr = fstr.gsub(/^(\+\-+)*\+$\n/, '')

# Replace blank fields with "| NULL |".
# We need to loop this because if there are multiple blank fields in a row,
# the regex will not match on the final pipe character of the previous
# blank match.
loop { break unless fstr.gsub!(/\| +\|/, '| NULL |') }

# Replace inner dividers.
fstr = fstr.gsub(/ +\| +/, '","')

# Replace outer dividers.
fstr = fstr.gsub(/(\| +| +\|)/, '"')

# Replace "NULL"s.
fstr = fstr.gsub(/"NULL"/, '""')

# Output converted contents in what is now a CSV format.
output_path_str = input_path.to_s
  .reverse
  .sub(input_path.extname.reverse, '.csv'.reverse)
  .reverse
File.open(output_path_str, 'w') { |f| f.write(fstr) }
