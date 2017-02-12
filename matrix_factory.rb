require 'matrix'

class MatrixFactory < AbstractMatrixFactory

    @matrix
    def initialize()

    end
    
    def initialize(rows, cols)
        # no pre or post conditions
        makeMatrix(rows, cols)
    end

    def initialize(content)
        makeMatrix(content)
    end

    def makeMatrix(rows, cols)
        pre_makeMatrix(rows, cols)

        matrix = Matrix.build(2, 3){|row, col| 0}
        # no class invariants
        post_makeMatrix(rows, cols)
    end

    def makeMatrix(content)
        pre_makeMatrix(content)
        # no class invariants
        # implementation
        matrix = Matrix.columns(content)
        post_makeMatrix(content)
    end
end
