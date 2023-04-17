
package fraction is

    type Frac is private;

    function create (num: integer; den: integer) return Frac;

    function "*" (left: Frac; right: Frac) return Frac;

    function "+" (left: Frac; right: Frac) return Frac;

    procedure put (output: Frac);

    procedure get(input: out Frac);

private

    type Frac is record
        num: integer;
        den: integer;
    end record;


end fraction;