require 'test/unit/assertions'

include Test::Unit::Assertions

require_relative 'sparse_matrix'
require_relative 'dok_matrix'

require 'matrix'

myMatrix = DoKMatrix.new(3, 2)
myMatrix.set(1, 1, 0)
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
myOther.set(1, 0, 0)
myOther.set(1, 1, 1)
myOther.set(1, 1, 2)
myOther.set(1, 1, 0)
myOther.set(1, 2, 2)
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
