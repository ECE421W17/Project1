require 'test/unit/assertions'

include Test::Unit::Assertions

require_relative 'sparse_matrix'

class DoKMatrix
    include SparseMatrix

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
        ret = nil

        self.post_transpose(ret)

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

        self.post_sparsity(ret)
        self.assert_class_invariants()
    end

    def isTridiagonal?()
        self.pre_isTridiagonal()

        # implementation
        ret = false

        self.post_isTridiagonal(ret)
        self.assert_class_invariants()
    end

    def isDiagonal?()
        self.pre_isDiagonal()

        # implementation
        ret = false

        self.post_isDiagonal(ret)
        self.assert_class_invariants()
    end

    def to_s()
        self.pre_to_s()

        # implementation

        self.post_to_s()
        self.assert_class_invariants()
    end

    def iterate()
        self.pre_iterate()

        # implementation

        self.post_iterate()
        self.assert_class_invariants()
    end

    def fromOtherMatrixType(other)
        self.pre_fromOtherMatrixType(other)

        # implementation
        ret = 0

        self.post_fromOtherMatrixType(ret)
        self.assert_class_invariants()
    end
   
    def _addToScalar(other)
        self._pre_addToScalar(other)

        # implementation

        self._post_addToScalar(other)
        self.assert_class_invariants()
    end

    def _addToMatrix(other)
        self._pre_addToMatrix(other)

        # implementation

        self._post_addToMatrix(other)
        self.assert_class_invariants()
    end

    def _multiplyByMatrix(other)
        self._pre_multiplyByMatrix(other)

        # implementation

        self._post_multiplyByMatrix(other)
        self.assert_class_invariants()
    end

    def _multiplyByScalar(other)
        self._pre_multiplyByScalar(other)

        # implementation

        self._post_multiplyByScalar(other)
        self.assert_class_invariants()
    end

    def _subtractMatrix(other)
        self._pre_subtractMatrix(other)

        # implementation

        self._post_subtractMatrix(other)
        self.assert_class_invariants()
    end
end
