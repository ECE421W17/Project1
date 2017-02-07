class MatrixFactory < AbstractMatrixFactory

    def initialize()
        # no pre or post conditions
    end

    def makeMatrix(rows, cols)
        pre_makeMatrix(rows, cols)
        # no class invariants
        # implementation
        post_makeMatrix(rows, cols)
    end

    def makeMatrix(content)
        pre_makeMatrix(content)
        # no class invariants
        # implementation
        post_makeMatrix(content)
    end
end
