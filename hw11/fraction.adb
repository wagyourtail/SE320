with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

package body fraction is

    -- a couple functions to make simplifying fractions easier
    --

    -- gcd allows for easy simplification
    function gcd(a: integer; b: integer) return integer is
        temp: integer;
        a_mut: integer := a;
        b_mut: integer := b;
    begin
        while b_mut /= 0 loop
            temp := b_mut;
            b_mut := a_mut mod b_mut;
            a_mut := temp;
        end loop;
        return a_mut;
    end gcd;

    -- signum returns the sign of a number, allowing for inline simplification
    -- while making sure the denominator is positive
    function signum(a: integer) return integer is
    begin
        if a >= 0 then
            return 1;
        else
            return -1;
        end if;
    end signum;

    -- creation function since Frac is private,
     -- and we want to simplify fractions
    function create (num: integer; den: integer) return Frac is
        fraction: Frac;
    begin
        -- signum simply fixes the sign for the denominator to always be positive
        -- I guess this isn't nececairy if we always deal with positive fractions, but...
        fraction.num := signum(den) * num / gcd(num, den);
        fraction.den := signum(den) * den / gcd(num, den);
        return fraction;
    end create;

    -- overloaded operators
    function "+" (left: Frac; right: Frac) return Frac is
    begin
        return create(left.num * right.den + right.num * left.den, left.den * right.den);
    end "+";

    function "*" (left: Frac; right: Frac) return Frac is
    begin
        return create(left.num * right.num, left.den * right.den);
    end "*";

    -- overload io
    procedure get(input: out Frac) is
        num: integer;
        den: integer;
        throwaway: character;
    begin
        get(num);
        get(throwaway);
        get(den);
        input := create(num, den);
    end get;

    procedure put(output: Frac) is
    begin
        put(output.num, 0);
        put("/");
        put(output.den, 0);
    end put;

end fraction;