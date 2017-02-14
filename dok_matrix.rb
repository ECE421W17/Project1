require 'test/unit/assertions'

include Test::Unit::Assertions

require_relative 'sparse_matrix'

require 'matrix'

class DoKMatrix
    include SparseMatrix

    # Done?
    def initialize(row, col)
        self.pre_initialize(row, col)

        # implementation
        @rowSize = row
        @colSize = col
        @internalHash = Hash.new(0)

        self.post_initialize(row, col)
        self.assert_class_invariants()
    end

    def _get_delegate_matrix
        Matrix.build(@rowSize, @colSize) { |row, col| get(row, col) }
    end

    def self.rows(other)
        matrix = Matrix.rows(other)
        newMatrix = DoKMatrix.new(matrix.row_size, matrix.column_size)
        (0..matrix.row_size - 1).each do |r|
            (0..matrix.column_size - 1).each do |c|
                val = matrix.[](r,c)
                newMatrix.set(val, r,c)
            end
        end
        newMatrix
    end



    def get(*indices)
        self.assert_class_invariants()
        self.pre_get(*indices)

        ret = @internalHash[indices]

        self.post_get(*indices)
        self.assert_class_invariants()

        ret
    end

    def set(new_value, *indices)
        self.assert_class_invariants()
        self.pre_set(new_value, *indices)

        @internalHash[indices] = new_value

        self.post_set(new_value, *indices)
        self.assert_class_invariants()
    end

    def +(other)
        self.assert_class_invariants()
        self.pre_plus(other)

        # Do we want to check if it is a SparseMatrix instead? Could be more extensible that way
        if other.is_a? DoKMatrix
          new_matrix = self._addToMatrix(other)
        else
          new_matrix = self._addToScalar(other)
        end

        self.post_plus(other)
        self.assert_class_invariants()

        new_matrix
    end

    def -(other)
        self.assert_class_invariants()
        self.pre_minus(other)

        if other.is_a? DoKMatrix
          new_matrix = self._subtractMatrix(other)
        else
          # Need to assert somewhere that other responds to multiplication
          #  Or make a sub-method, like in matrix subtraction, and do the assertion there instead
          other_negated = other * -1
          new_matrix = self._addToScalar(other_negated)
        end

        self.post_minus(other)
        self.assert_class_invariants()

        new_matrix
    end

    def *(other)
        self.assert_class_invariants()
        self.pre_multiply(other)

        # implementation

        self.post_multiply(other)
        self.assert_class_invariants()
    end


    def /(other)
        self.assert_class_invariants()
        self.pre_divide(other)

        # implementation

        self.post_divide(other)
        self.assert_class_invariants()
    end

    def transpose()
        self.assert_class_invariants()
        self.pre_transpose()

        # implementation
        ret = nil

        self.post_transpose(ret)

        self.assert_class_invariants()
    end

    def inverse()
        self.assert_class_invariants()
        self.pre_inverse()

        # implementation

        self.post_inverse()
        self.assert_class_invariants()
    end

    def rank()
        self.assert_class_invariants()
        self.pre_rank()

        ret = _get_delegate_matrix.rank

        self.post_rank()
        self.assert_class_invariants()

        ret
    end

    def determinant()
        self.assert_class_invariants()
        self.pre_determinant()

        ret = _get_delegate_matrix.determinant

        self.post_determinant()
        self.assert_class_invariants()

        ret
    end

    def sparsity()
        self.assert_class_invariants()
        self.pre_sparsity()

        # implementation
        ret = 0
        iterate(){|r, c, val| (val != 0? ret:ret = ret + 1)}
        sparsity = ret/(@rowSize * @colSize)

        self.post_sparsity(sparsity)
        self.assert_class_invariants()

        sparsity
    end

    def isTridiagonal?()
        self.assert_class_invariants()
        self.pre_isTridiagonal()

        ret = @rowSize == @colSize && !@internalHash.any? { |key, value| (key[0] - key[1]).abs > 1 && value != 0 }

        self.post_isTridiagonal(ret)
        self.assert_class_invariants()

        ret
    end

    def isDiagonal?()
        self.assert_class_invariants()
        self.pre_isDiagonal()

        # implementation
        ret = false

        self.post_isDiagonal(ret)
        self.assert_class_invariants()
    end

    def to_s()
        self.assert_class_invariants()
        self.pre_to_s()

        # implementation
        iterate(){|r, c, val| puts "[#{r+1},#{c+1}, value:#{val}]"}

        self.post_to_s()
        self.assert_class_invariants()
    end

    def iterate()
        self.assert_class_invariants()
        self.pre_iterate()

        # passes to the block the row, column, and value
        (0..@rowSize - 1).each do |r|
            (0..@colSize - 1).each do |c|
                val = get(r,c)
                yield(r, c, val)
            end
        end

        self.post_iterate()
        self.assert_class_invariants()
    end

    def _addToScalar(other)
        self.assert_class_invariants()
        self._pre_addToScalar(other)

        self.iterate { |row, col, val|
          self.set(val + other.to_f, row, col)
        }

        self._post_addToScalar(other)
        self.assert_class_invariants()

        self
    end

    def _addToMatrix(other)
        self.assert_class_invariants()
        self._pre_addToMatrix(other)

        self_delegate_matrix = self._get_delegate_matrix
        other_delegate_matrix = other._get_delegate_matrix

        updated_matrix = self_delegate_matrix + other_delegate_matrix
        updated_matrix.each_with_index {
          |val, row, col| self.set(val, row, col)
        }

        self._post_addToMatrix(other)
        self.assert_class_invariants()

        self
    end

    def _multiplyByMatrix(other)
        self.assert_class_invariants()
        self._pre_multiplyByMatrix(other)

        # implementation

        self._post_multiplyByMatrix(other)
        self.assert_class_invariants()
    end

    def _multiplyByScalar(other)
        self.assert_class_invariants()
        self._pre_multiplyByScalar(other)

        # implementation

        self._post_multiplyByScalar(other)
        self.assert_class_invariants()
    end

    def _subtractMatrix(other)
        self.assert_class_invariants()
        self._pre_subtractMatrix(other)

        self_delegate_matrix = self._get_delegate_matrix
        other_delegate_matrix = other._get_delegate_matrix

        updated_matrix = self_delegate_matrix - other_delegate_matrix
        updated_matrix.each_with_index {
          |val, row, col| self.set(val, row, col)
        }

        self._post_subtractMatrix(other)
        self.assert_class_invariants()

        self
    end
end
