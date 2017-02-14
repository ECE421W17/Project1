require './dok_matrix'
require_relative './abstract_matrix_factory'

class SparseMatrixFactory 
    include AbstractMatrixFactory
    def initialize()
    end

    def makeMatrixWithRowsCols(rows, cols)
        self.pre_makeMatrixWithRowsCols(rows, cols)
        matrix = DoKMatrix.new(rows, cols)
        self.post_makeMatrixWithRowsCols(rows, cols)
        matrix
    end

    def makeMatrixWithMatrix(content)
        self.pre_makeMatrixWithMatrix(content)
        matrix = DoKMatrix.rows(content)
        self.post_makeMatrixWithMatrix(content)
        matrix
    end
end
