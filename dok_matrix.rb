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
        self.pre_initialize(row, col)   
        
        # implementation
        @rowSize = row
        @colSize = col
        @internalHashRep = Hash.new(0)

        self.post_initialize(row, col)
        self.assert_class_invariants()
    end
    
    def get(*indices)
        self.pre_get(*indices)

        # implementation
        ret = 0

        self.post_get(*indices)
        self.assert_class_invariants()

        ret
    end

    def set(new_value, *indices)
        self.pre_set(new_value, *indices)

        # implementation

        self.post_set(new_value, *indices)
        self.assert_class_invariants()
    end

    def +(other)
        self.pre_plus(other)

        # implementation

        self.post_plus(other)
        self.assert_class_invariants()
    end

    def -(other)
        self.pre_minus(other)

        # implementation

        self.post_minus(other)
        self.assert_class_invariants()
    end

    def *(other)
        self.pre_multiply(other)

        # implementation

        self.post_multiply(other)
        self.assert_class_invariants()
    end


    def /(other)
        self.pre_divide(other)

        # implementation
        
        self.post_divide(other)
        self.assert_class_invariants()
    end
    
    def transpose()
        self.pre_transpose()

        # implementation

        self.post_transpose()

        self.assert_class_invariants()
    end

    def inverse()
        self.pre_inverse()

        # implementation

        self.post_inverse()
        self.assert_class_invariants()
    end

    def rank()
        self.pre_rank()

        # implementation

        self.post_rank()
        self.assert_class_invariants()
    end

    def determinant()
        self.pre_determinant()
        # implementation

        self.post_determinant()
        self.assert_class_invariants()
    end

    def sparsity()
        self.pre_sparsity()
        
        # implementation
        ret = 0

        self.post_sparsity()
        self.assert_class_invariants()
    end

    def isTridiagonal?()
        self.pre_isTridiagonal()

        # implementation
        ret = false

        self.post_isTridiagonal()
        self.assert_class_invariants()
    end

    def isDiagonal?()
        self.pre_isDiagonal()

        # implementation

        self.post_isDiagonal()
        self.assert_class_invariants()
    end

    def to_s()
        # pre-conditions
        # None

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def iterate()
        # pre-conditions
        # None

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def toDoK()
        # pre-conditions
        # None

        # implementation
        ret = Hash.new

        # post-conditions
        assert(ret.is_a?(Hash), "Return value is not a hash. It's a #{ret.class}")

        self.assert_class_invariants()
    end

    def fromOtherMatrixType(other)
        # pre-conditions
        assert(other != nil, "Other is nil")

        # implementation
        ret = 0

        # post-conditions
        assert(ret != nil, "Return value is nil")

        self.assert_class_invariants()
    end

    def getType()
        # pre-conditions
        # None

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end
    
    def _addToScalar(other)
        # pre-conditions
        assert(other.is_a?(Numeric), "Other is not a scalar : #{other}")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def _addToMatrix(other)
        # pre-conditions
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @rowSize, "Other has a different row size")
        assert(other.colSize == @colSize, "Other has a different column size")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def _multiplyByMatrix(other)
        # pre-conditions
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @colSize, "Matrix's row size does not match other matrix's column size")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def _multiplyByScalar(other)
        # pre-conditions
        assert(other.is_a?(Numeric), "Other is not a scalar : #{other}")

        # implementation

        # post-conditions
        # None

        self.assert_class_invariants()
    end

    def _subtractMatrix(other)
        # pre-conditions
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @rowSize, "Other has a different row size")
        assert(other.colSize == @colSize, "Other has a different column size")

        # implementation

        # post-conditions

        self.assert_class_invariants()
    end
end