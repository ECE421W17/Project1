
class SparseMatrix

    def initialize()
        @internal_rep = Hash.new(0)
    end

    def initialize(*arrays)
        @internal_rep = Hash.new(0)
        arrays.each_with_index do |row, i|
            row.each_with_index do |element, j|
                if element != 0
                    @internal_rep[[i,j]] = element
                end
            end
        end
    end

    def +(other)
        if other.is_a(SparseMatrix)
            _addToMatrix(other)
        elsif other.is_a(Numeric)
            _addToScalar(other)
        end
    end

    def -(other)
        if other.is_a(SparseMatrix)
            _subtractMatrix(other)
        elsif other.is_a(Numeric)
            _addToScalar(-other)
        end
    end

    def *(other)
        if other.is_a(SparseMatrix)
            _multiplyByMatrix(other)
        elsif other.is_a(Numeric)
            _multiplyByScalar(other)
        end
    end

    def get(*indices)
        @internal_rep[indices]
    end

    def set(new_value, *indices)
        @internal_rep[indices] = new_value
    end

    def transpose()
    end

    def inverse()
    end

    def rank()
    end

    def determinant()
    end

    def _addToScalar(other)
    end

    def _addToMatrix(other)
    end

    def _multiplyByMatrix(other)
    end

    def _multiplyByScalar(other)
    end

    def _subtractMatrix(other)
    end
end


