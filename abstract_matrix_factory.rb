require 'test/unit/assertions'
require './dok_matrix'

include Test::Unit::Assertions

class AbstractMatrixFactory
    
    def pre_makeMatrixWithRowsCols(rows, cols)
        assert(rows.respond_to?(:to_i), "Rows cannot be used as integer")
        assert(cols.respond_to?(:to_i), "Columns cannot be used as integer")
        assert(0 < rows, "Number of rows is not positive")
        assert(0 < cols, "Number of columns is not positive")
    end

    def self.makeMatrixWithRowsCols(rows, cols)
        pre_makeMatrixWithRowsCols(rows, cols)
        post_makeMatrixWithRowsCols(rows, cols)
    end

    def self.makeSparseMatrix(*args)
        if args.size == 1
            pre_makeMatrixWithMatrix(args)
            SparseMatrixFactory.makeMatrixWithMatrix(args)
        end
        if args.size == 2
            pre_makeMatrixWithRowsCols(args[0], args[1])
            SparseMatrixFactory.makeMatrixWithRowsCols(args[0], args[1])
        end
    end

    def self.makeRegularMatrix(*args)
        if args.size == 1
            MatrixFactory.makeMatrixWithMatrix(args)
        end
        if args.size == 2
            MatrixFactory.makeMatrixWithRowsCols(args[0], args[1])
        end
    end


    def post_makeMatrixWithRowsCols(rows, cols)
    end

    def pre_makeMatrixWithMatrix(content)
        assert(content.respond_to?(:[]), "Content does not overload [] operator")
    end

    def self.makeMatrixWithMatrix(content)
        pre_makeMatrixWithMatrix(content)

        # implementation
        #raise NotImplementedError
        # no class invariants     
        post_makeMatrixWithMatrix(content)
    end

    def post_makeMatrixWithMatrix(content)
    end
end
