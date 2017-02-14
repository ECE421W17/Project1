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

puts '***********************************'

# *****

myMatrix = DoKMatrix.new(3, 2)
myMatrix.set(1, 0, 1)
myMatrix.to_s

transposed = DoKMatrix.new(2, 3)
transposed = myMatrix.transpose
transposed.to_s

myMatrix = myMatrix._multiplyByScalar(2)
myMatrix.to_s

newMatrix = myMatrix._multiplyByDoKMatrix(transposed)
newMatrix.to_s

myMatrix = myMatrix*2
myMatrix.to_s

myMatrix = myMatrix*transposed
myMatrix.to_s

myOther = DoKMatrix.new(3, 3)
myOther.set(0, 0, 1)
myOther.set(1, 1, 1)
myOther.set(1, 2, 1)
myOther.set(1, 0, 1)
myOther.set(2, 2, 1)
myOther.inverse.to_s
myOtherInverse = myOther.inverse

(myOther / myOtherInverse).to_s

myMatrix = myMatrix / 2
myMatrix.to_s

aMatrix = Matrix.build(3, 2) {|row, col| 1}
mult = myMatrix * aMatrix
mult.to_s


aMatrix = Matrix.build(3, 3) {|row, col| 1}
aMatrix.send(:[]=, 0, 2, 0)
aMatrix.send(:[]=, 2, 0, 0)
mult = myMatrix / aMatrix
mult.to_s
