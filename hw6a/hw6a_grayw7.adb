with ada.Text_IO, ada.Integer_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO;


procedure hw6a_grayw7 is
    type Matrix2D is array (Positive range <>, Positive range <>) of Integer;

    procedure put(mat: Matrix2D) is
        max: Integer := 0;
    begin
        -- get max
        for i in mat'Range(1) loop
            for j in mat'Range(2) loop
                if mat(i,j) > max then
                    max := mat(i,j);
                end if;
            end loop;
        end loop;
        -- "cheat" to get the max number of digits
        max := max'Image'Length;
        -- output matrix
        new_line;
        for i in mat'Range(1) loop
            for j in mat'Range(2) loop
                put(mat(i,j), max);
            end loop;
            new_line;
        end loop;


    end put;

    procedure get(mat: out Matrix2D) is
    begin
        -- request matrix
        for i in mat'Range(1) loop
            for j in mat'Range(2) loop
                get(mat(i,j));
            end loop;
        end loop;
    end get;

    function "*"(mat1: Matrix2D; mat2: Matrix2D) return Matrix2D is
        output: Matrix2D(1..mat1'Last(1), 1..mat2'Last(2));
    begin
        -- initialize output matrix to 0's
        output := (others => (others => 0));
        -- check if the matrices can be multiplied
        if mat1'Last(2) /= mat2'Last(1) then
            raise Program_Error with "Matrices cannot be multiplied, invalid dimensions.";
        end if;
        -- multiply matrices
        for row in mat1'Range(1) loop
            for col in mat2'Range(2) loop
                for i in mat1'Range(2) loop
                    output(row, col) := output(row, col) + mat1(row, i) * mat2(i, col);
                end loop;
            end loop;
        end loop;
        return output;
    end "*";

    width: Positive;
    height: Positive;
    throwaway: character;
begin
    -- request first matrix
    put("Enter the size of the first matrix as two integers separated by 'x': ");
    get(height);
    get(throwaway);
    get(width);
    declare
        mat1: Matrix2D(1..height, 1..width) := (others => (others => 0));
    begin
        -- request second matrix
        put("Enter the size of the second matrix as two integers separated by 'x': ");
        get(height);
        get(throwaway);
        get(width);
        declare
            mat2: Matrix2D(1..height, 1..width) := (others => (others => 0));
            multiplied: Matrix2D(1..mat1'Last(1), 1..mat2'Last(2)) := (others => (others => 0));
        begin
            put("For the first matrix, enter ");
            put(mat1'Last(1), 0);
            put(" rows of ");
            put(mat1'Last(2), 0);
            put(" integers: ");
            new_line;
            get(mat1);

            put("For the second matrix, enter ");
            put(height, 0);
            put(" rows of ");
            put(width, 0);
            put(" integers: ");
            new_line;
            get(mat2);

            -- multiply matrices
            multiplied := mat1 * mat2;

            -- output result
            new_line;
            put("The result of the multiplication is the ");
            put(multiplied'Last(1), 0);
            put(" by ");
            put(multiplied'Last(2), 0);
            put(" matrix: ");
            put(multiplied);
        end;
    end;
end hw6a_grayw7;