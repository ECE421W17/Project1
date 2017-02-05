require 'test/unit/assertions'

include Test::Unit::Assertions

require_relative 'sparse_matrix'

class DoKMatrix
    include SparseMatrix

    def assert_class_invariants
        assert(@rowSize.is_a?(Integer), "Row size is not an integer")
        assert(@colSize.is_a?(Integer), "Column size is not an integer")        
        assert(@rowSize > 0, "Row size is not greater than zero")
        assert(@colSize > 0, "Column size is not greater than zero")
    end

    def initialize(row, col)
        # pre conditions
        assert(row.is_a?(Integer), "row parameter is not an integer")
        assert(col.is_a?(Integer), "col parameter is not an integer")
        assert(row > 0, "row parameter is not greater than zero")
        assert(col > 0, "col parameter is not greater than zero")
        
        # implementation
        @rowSize = row
        @colSize = col
        @internalHashRep = Hash.new(0)


        # post conditions
        assert(self != nil, "matrix was not created")
        assert(@rowSize == row, "rowSize is not equal to row")
        assert(@colSize == col, "colSize is not equal to col")
        (0..(row-1)).each do |r|
            (0..(col-1)).each do |c|
                assert(self.get(r,c) == 0, "Element (#{r},#{c}) was not zero")
            end
        end

        self.assert_class_invariants()
    end
    
    def get(*indices)
        # pre-conditions
        assert(indices[0].is_a?(Integer), "First index is not an integer")
        assert(indices[0] >= 0, "First index is not greater or equal to zero")
        assert(indices[0] < @rowSize, "First index is not less than first dimension")
        assert(indices[1].is_a?(Integer), "Second index is not an integer")
        assert(indices[1] >= 0, "Second index is not greater or equal to zero")
        assert(indices[1] < @colSize, "Second index is not less than second dimension")

        # implementation
        ret = 0

        # post-conditions
        # None

        self.assert_class_invariants()

        ret
    end

    def set(new_value, *indices)
        # pre-conditions
        assert(indices[0].is_a?(Integer), "First index is not an integer")
        assert(indices[0] >= 0, "First index is not greater or equal to zero")
        assert(indices[0] < @rowSize, "First index is not less than first dimension")
        assert(indices[1].is_a?(Integer), "Second index is not an integer")
        assert(indices[1] >= 0, "Second index is not greater or equal to zero")
        assert(indices[1] < @colSize, "Second index is not less than second dimension")
        assert(new_value.is_a?(Numeric), "New value is not numeric")

        # implementation

        # post-conditions
        i, j = indices[0..1]
        el = self.get(i, j)
        assert(el == new_value, "Element at (#{i}, #{j}) is #{el} instead of new value #{new_value}")

        self.assert_class_invariants()
    end

    def +(other)
        # pre-conditions
        assert(other != nil, "Other is nil")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def -(other)
        # pre-conditions
        assert(other != nil, "Other is nil")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def *(other)
        # pre-conditions
        assert(other != nil, "Other is nil")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end


    def /(other)
        # pre-conditions
        assert(other != nil, "Other is nil")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end
    
    def transpose()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def inverse()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def rank()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def determinant()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def sparsity()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def isTridiagonal?()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def isDiagonal?()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def to_s()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def iterate()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def toDoK()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def fromOtherMatrixType(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def getType()
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end
    
    def _addToScalar(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def _addToMatrix(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def _multiplyByMatrix(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def _multiplyByScalar(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end

    def _subtractMatrix(other)
        # pre-conditions

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end
end