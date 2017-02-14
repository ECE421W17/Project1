require 'matrix'
require_relative './abstract_matrix_factory'

class MatrixFactory 
    include AbstractMatrixFactory

    def initialize()
    end
    def makeMatrixWithRowsCols(rows, cols)
        self.pre_makeMatrixWithRowsCols(rows, cols)
        matrix = Matrix.build(rows, cols){|row, col| 0}
        self.post_makeMatrixWithRowsCols(rows, cols)
        matrix
    end

    def makeMatrixWithMatrix(content)
        self.pre_makeMatrixWithMatrix(content)
        # implementation
        matrix = Matrix.rows(content)
        self.post_makeMatrixWithMatrix(content)
        matrix
    end
end
