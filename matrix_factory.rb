require 'matrix'

class MatrixFactory < AbstractMatrixFactory
    def self.makeMatrixWithRowsCols(rows, cols)
        matrix = Matrix.build(rows, cols){|row, col| 0}
        matrix
    end

    def self.makeMatrixWithMatrix(content)
        # no class invariants
        # implementation
        matrix = Matrix.columns(content)
        matrix
    end
end