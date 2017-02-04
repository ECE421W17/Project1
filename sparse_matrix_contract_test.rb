require_relative 'sparse_matrix'
require_relative 'dok_matrix'

require 'test/unit'
require 'test/unit/ui/console/testrunner'

class SparseMatrixContractTest < Test::Unit::TestCase

    DIMENSIONS = 4
    
    def setup
        @mat = DoKMatrix.new(DIMENSIONS, DIMENSIONS)
    end

    def test_initialize
        # pre-conditions:
        # row >0 and row type: integer
        # col > 0 and col type : integer
        row = 3
        col = 4
        mat_test = DoKMatrix.new(row, col)

        # post-conditions:
        # sparse matrix is created
        # sparse matrix is filled with zeros in every element
        # @rowSize = row
        # @colSize = col

        assert(mat_test, "matrix was not created")
        assert(mat_test.rowSize == row, "rowSize is not equal to row")
        assert(mat_test.colSize == col, "colSize is not equal to col")
        (0..(row-1)).each do |r|
            (0..(col-1)).each do |c|
                assert(mat_test.get(r,c) == 0, "Element (#{r},#{c}) was not zero")
            end
        end
    end

    def teardown
        @mat = nil
    end

end

Test::Unit::UI::Console::TestRunner.run(SparseMatrixContractTest)