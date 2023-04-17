with ada.text_io;
with fraction;

use ada.text_io;
use fraction;

procedure hw11_grayw7 is
    left: frac;
    right: frac;
    sign: character;
begin
    loop
        put("?  ");
        get(left);
        get(sign);
        get(right);

        put("    ");
        put(left);
        put(" ");
        put(sign);
        put(" ");
        put(right);
        put(" = ");
        case sign is
            when '+' => put(left + right);
            when '*' => put(left * right);
            when others => put("Invalid operator");
        end case;
        new_line;

    end loop;

end hw11_grayw7;