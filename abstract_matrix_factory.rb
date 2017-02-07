class AbstractMatrixFactory

    def pre_makeMatrix(rows, cols)
        assert(rows.respond_to?(:to_i), "Rows cannot be used as integer")
        assert(cols.respond_to?(:to_i), "Columns cannot be used as integer")
        assert(0 < rows, "Number of rows is not positive")
        assert(0 < cols, "Number of columns is not positive")
    end

    def makeMatrix(rows, cols)
        pre_makeMatrix(rows, cols)

        # implementation
        # no class invariants
        raise NotImplementedError
        
        post_makeMatrix(rows, cols)
    end

    def post_makeMatrix(rows, cols)
    end

    def pre_makeMatrix(content)
        assert(content.respond_to?(:[]), "Content does not overload [] operator")
    end

    def makeMatrix(content)
        pre_makeMatrix(content)

        # implementation
        # no class invariants
        raise NotImplementedError
        
        post_makeMatrix(content)
    end

    def post_makeMatrix(content)
    end
end
