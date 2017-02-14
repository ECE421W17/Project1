require 'test/unit/assertions'
require './dok_matrix'

include Test::Unit::Assertions

module AbstractMatrixFactory
    
    def pre_makeMatrixWithRowsCols(rows, cols)
        assert(rows.respond_to?(:to_i), "Rows cannot be used as integer")
        assert(cols.respond_to?(:to_i), "Columns cannot be used as integer")
        assert(0 < rows, "Number of rows is not positive")
        assert(0 < cols, "Number of columns is not positive")
    end

    def makeMatrixWithRowsCols(rows, cols)
        pre_makeMatrixWithRowsCols(rows, cols)
        raise NotImplementedError
        post_makeMatrixWithRowsCols(rows, cols)
    end

    def post_makeMatrixWithRowsCols(rows, cols)
    end

    def pre_makeMatrixWithArray(content)
        assert(content.respond_to?(:[]), "Content does not overload [] operator")
        begin
            Matrix.rows(content)
        rescue
            assert(false, "Cannot convert content to a matrix")
        end
    end

    def makeMatrixWithArray(content)
        pre_makeMatrixWithMatrix(content)
        # implementation
        raise NotImplementedError
        # no class invariants     
        post_makeMatrixWithMatrix(content)
    end

    def post_makeMatrixWithArray(content)
    end

    def pre_makeMatrixWithMatrix(content)
        assert(content.is_a?(Matrix), "The input is not a matrix")
    end

    def makeMatrixWithMatrix(content)
        pre_makeMatrixWithMatrix(content)
        # implementation
        raise NotImplementedError
        # no class invariants     
        post_makeMatrixWithMatrix(content)
    end

    def post_makeMatrixWithMatrix(content)
    end
end
