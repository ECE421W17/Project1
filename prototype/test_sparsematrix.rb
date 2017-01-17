require_relative 'sparsematrix'

sm = SparseMatrix.new([0, 0, 0, 2, 0, 0], [0, 0, 0, 4, 0, 0])
puts sm.get(0,0)
puts sm.get(0,3)
puts sm.get(1,3)
puts sm.get(4,1)

sm.set(12, 0, 0)
sm.set(15, 0, 1)
puts sm.get(0,0)
puts sm.get(0,1)
puts sm.get(0,2)
