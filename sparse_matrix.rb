module SparseMatrix
    
    def pre_initialize(row, col)
        assert(row.is_a?(Integer), "row parameter is not an integer")
        assert(col.is_a?(Integer), "col parameter is not an integer")
        assert(row > 0, "row parameter is not greater than zero")
        assert(col > 0, "col parameter is not greater than zero")
    end

    def initialize(row, col)
        raise NotImplementedError
    end

    def post_initialize(row, col)
        assert(self != nil, "matrix was not created")
        assert(@rowSize == row, "rowSize is not equal to row")
        assert(@colSize == col, "colSize is not equal to col")
        (0..(row-1)).each do |r|
            (0..(col-1)).each do |c|
                assert(self.get(r,c) == 0, "Element (#{r},#{c}) was not zero")
            end
        end
    end
    
    def pre_get(*indices)
        assert(indices[0].is_a?(Integer), "First index is not an integer")
        assert(indices[0] >= 0, "First index is not greater or equal to zero")
        assert(indices[0] < @rowSize, "First index is not less than first dimension")
        assert(indices[1].is_a?(Integer), "Second index is not an integer")
        assert(indices[1] >= 0, "Second index is not greater or equal to zero")
        assert(indices[1] < @colSize, "Second index is not less than second dimension")
    end

    def get(*indices)
        raise NotImplementedError
    end

    def post_get(*indices)
    end
    
    def pre_set(new_value, *indices)
        assert(indices[0].is_a?(Integer), "First index is not an integer")
        assert(indices[0] >= 0, "First index is not greater or equal to zero")
        assert(indices[0] < @rowSize, "First index is not less than first dimension")
        assert(indices[1].is_a?(Integer), "Second index is not an integer")
        assert(indices[1] >= 0, "Second index is not greater or equal to zero")
        assert(indices[1] < @colSize, "Second index is not less than second dimension")
        assert(new_value.is_a?(Numeric), "New value is not numeric")
    end

    def set(new_value, *indices)
        raise NotImplementedError
    end

    def post_set(new_value, *indices)
        i, j = indices[0..1]
        el = self.get(i, j)
        assert(el == new_value, "Element at (#{i}, #{j}) is #{el} instead of new value #{new_value}")
    end

    def pre_plus(other)
        assert(other != nil, "Other is nil")
    end

    def +(other)
        raise NotImplementedError
    end

    def post_plus(other)
    end

    def pre_minus(other)
        assert(other != nil, "Other is nil")
    end

    def -(other)
        raise NotImplementedError
    end

    def post_minus(other)
    end

    def pre_divide(other)
        assert(other != nil, "Other is nil")
    end

    def /(other)
        raise NotImplementedError
    end

    def post_divide(other)
    end

    def pre_multiply(other)
        assert(other != nil, "Other is nil")
    end

    def *(other)
        raise NotImplementedError
    end

    def post_multiply(other)
    end

    def pre_transpose()
    end

    def transpose()
        raise NotImplementedError
    end

    def post_transpose()
    end

    def pre_inverse()
        det = self.determinant()
        assert(det != 0, "Determinant should be zero to invert, but it is #{det}")
    end

    def inverse()
        raise NotImplementedError
    end

    def post_inverse()
    end

    def pre_rank()
    end

    def rank()
        raise NotImplementedError
    end

    def post_rank()
    end

    def pre_determinant()
    end

    def determinant()
        raise NotImplementedError
    end

    def post_determinant()
    end

    def pre_sparsity()
    end

    def sparsity()
        raise NotImplementedError
    end

    def post_sparsity(ret)
        assert(ret >= 0 && ret <= 1, "Return value #{ret} is not a number between 0 and 1 inclusive")
    end

    def pre_isTridiagonal()
    end

    def isTridiagonal?()
        raise NotImplementedError
    end

    def post_isTridiagonal(ret)
        assert(ret.is_a?(FalseClass) || ret.is_a?(TrueClass), "Return value is not a boolean : #{ret}")
    end

    def pre_isDiagonal()
    end

    def isDiagonal?()
        raise NotImplementedError
    end

    def post_isDiagonal(ret)
        assert(ret.is_a?(FalseClass) || ret.is_a?(TrueClass), "Return value is not a boolean : #{ret}")
    end

    def pre_to_s()
    end

    def to_s()
        raise NotImplementedError
    end

    def post_to_s()
    end

    def pre_iterate()
    end

    def iterate()
        raise NotImplementedError
    end

    def post_iterate()
    end

    def pre_toDoK()
    end

    def toDoK()
        raise NotImplementedError
    end

    def post_toDoK()
        assert(ret.is_a?(Hash), "Return value is not a hash. It's a #{ret.class}")
    end

    def pre_fromOtherMatrixType(other)
        assert(other != nil, "Other is nil")
    end

    def fromOtherMatrixType(other)
        raise NotImplementedError
    end

    def post_fromOtherMatrixType(ret)
        assert(ret != nil, "Return value is nil")
    end

    def pre_getType()
    end

    def getType()
        raise NotImplementedError
    end

    def post_getType()
    end
    
    def _pre_addToScalar(other)
        assert(other.is_a?(Numeric), "Other is not a scalar : #{other}")
    end

    def _addToScalar(other)
        raise NotImplementedError
    end

    def _post_addToScalar(other)
    end

    def _pre_addToMatrix(other)
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @rowSize, "Other has a different row size")
        assert(other.colSize == @colSize, "Other has a different column size")
    end

    def _addToMatrix(other)
        raise NotImplementedError
    end

    def _post_addToMatrix(other)
    end

    def _pre_multiplyByMatrix(other)
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @colSize, "Matrix's row size does not match other matrix's column size")
    end

    def _multiplyByMatrix(other)
        raise NotImplementedError
    end
    
    def _post_multiplyByMatrix(other)
    end

    def _pre_multiplyByScalar(other)
        assert(other.is_a?(Numeric), "Other is not a scalar : #{other}")
    end

    def _multiplyByScalar(other)
        raise NotImplementedError
    end

    def _post_multiplyByScalar(other)
    end

    def _pre_subtractMatrix(other)
        assert(other.included_modules.include?(SparseMatrix), "Other is not a matrix")
        assert(other.rowSize == @rowSize, "Other has a different row size")
        assert(other.colSize == @colSize, "Other has a different column size")
    end

    def _subtractMatrix(other)
        raise NotImplementedError
    end

    def _post_subtractMatrix(other)
    end

end
