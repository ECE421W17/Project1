require './sparse_matrix'
require './abstract_matrix_factory'
require './sparse_matrix_factory'
require './matrix_factory'
require './dok_matrix'

# Students
# Rui "James" Wu
# Derek Shultz
# Andrew Lawrence
# Vitor Mendonca

# To run the program, open a ruby console such as irb
# and require this file
#
# The main class to use is DoKMatrix. Refer to documentation for use

# *****
# Addition/Subtraction Tests:

dok_matrix = DoKMatrix.new(2,2)

dok_matrix.iterate { |row, col, val|
  puts 'Next row: ' + row.to_s
  puts 'Next col: ' + col.to_s
  puts 'Next val: ' + val.to_s
}

new_dok_matrix = dok_matrix - 2

new_dok_matrix.iterate { |row, col, val|
  puts 'Next row: ' + row.to_s
  puts 'Next col: ' + col.to_s
  puts 'Next val: ' + val.to_s
}

other_dok_matrix = DoKMatrix.new(2,2)
other_dok_matrix = other_dok_matrix + 3

res_mat = new_dok_matrix - other_dok_matrix

res_mat.iterate { |row, col, val|
  puts 'Next row: ' + row.to_s
  puts 'Next col: ' + col.to_s
  puts 'Next val: ' + val.to_s
}

real_mat = Matrix.identity(2)

puts 'Row count: ' + real_mat.row_count.to_s
puts 'Column count: ' + real_mat.column_count.to_s

other_res_mat = new_dok_matrix - real_mat

other_res_mat.iterate { |row, col, val|
  puts 'Next row: ' + row.to_s
  puts 'Next col: ' + col.to_s
  puts 'Next val: ' + val.to_s
}

# *****
