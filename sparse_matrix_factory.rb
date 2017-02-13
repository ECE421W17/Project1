require './dok_matrix'

class SparseMatrixFactory < AbstractMatrixFactory
    def self.makeMatrixWithRowsCols(rows, cols)
        pre_makeMatrixWithRowsCols(rows, cols)
        matrix = DoKMatrix.new(rows, cols)
        matrix
    end

    def self.makeMatrixWithMatrix(content)
        makeMatrixWithMatrix(content)
        # no class invariants
        # implementation
        matrix = DoKMatrix.new(1, 2)
        matrix
        makeMatrixWithMatrix(content)
    end
end
