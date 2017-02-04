module SparseMatrix

    def get(*indices)
        raise NotImplementedError
    end

    def set(new_value, *indices)
        raise NotImplementedError
    end

    def +(other)
        raise NotImplementedError
    end

    def -(other)
        raise NotImplementedError
    end

    def /(other)
        raise NotImplementedError
    end

    def *(other)
        raise NotImplementedError
    end

    def transpose()
        raise NotImplementedError
    end

    def inverse()
        raise NotImplementedError
    end

    def rank()
        raise NotImplementedError
    end

    def determinant()
        raise NotImplementedError
    end

    def sparsity()
        raise NotImplementedError
    end

    def isTridiagonal?()
        raise NotImplementedError
    end

    def isDiagonal?()
        raise NotImplementedError
    end

    def to_s()
        raise NotImplementedError
    end

    def iterate()
        raise NotImplementedError
    end

    def toDoK()
        raise NotImplementedError
    end

    def fromOtherMatrixType(other)
        raise NotImplementedError
    end

    def getType()
        raise NotImplementedError
    end
    
    def _addToScalar(other)
        raise NotImplementedError
    end

    def _addToMatrix(other)
        raise NotImplementedError
    end

    def _multiplyByMatrix(other)
        raise NotImplementedError
    end

    def _multiplyByScalar(other)
        raise NotImplementedError
    end

    def _subtractMatrix(other)
        raise NotImplementedError
    end

end