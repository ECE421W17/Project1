require 'sparse_matrix'

class SparseMatrixFactory < AbstractMatrixFactory

    @matrix
    def initialize()
        # no pre or post conditions
    end

    def initialize(rows, cols)
        makeMatrix(rows, cols)
    end

    def initialize(content)
        makeMatrix(content)
    end

    def makeMatrix(rows, cols)
        pre_makeMatrix(rows, cols)
        # no class invariants
        # implementation
        matrix = sparse_matrix.new(row, col)
        post_makeMatrix(rows, cols)
    end

    def makeMatrix(content)
        pre_makeMatrix(content)
        matrix = sparse_matrix.new(content)
        # no class invariants
        # implementation
        post_makeMatrix(content)
    end
end
