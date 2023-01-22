with ada.Text_IO;
with ada.Integer_Text_IO;

use ada.text_IO;
use ada.Integer_Text_IO;

procedure hw2_grayw7 is
    input: Integer;
    min: Integer;
    min_pos: Integer;
    max_neg: Integer;
    max: Integer;
    count: Integer;
    count_pos: Integer;
    count_neg: Integer;
begin
    min := 0;
    min_pos := -1;
    max_neg := 1;
    max := 0;
    count:= 0;
    count_pos := 0;
    count_neg := 0;
    loop
        put("Enter an integer: ");
        get(input);
        exit when input = 0;
        -- global
        if input < min or else min = 0 then
            min := input;
        end if;
        if input > max or else max = 0 then
            max := input;
        end if;
        count := count + 1;
        if input > 0 then
            -- positive
            if input < min_pos or else min_pos = -1 then
                min_pos := input;
            end if;
            count_pos := count_pos + 1;
        else
            -- negative
            if input > max_neg or else max_neg = 1 then
                max_neg := input;
            end if;
            count_neg := count_neg + 1;
        end if;
    end loop;
    put("In total you entered ");
    put(count, 0);
    put(" integers.");
    new_line;
    put("The largest was: ");
    put(max, 0);
    new_line;
    put("The smallest was: ");
    put(min, 0);
    new_line;
    if not (min_pos = -1) then
        put("Total positive numbers entered: ");
        put(count_pos, 0);
        new_line;
        put("The largest positive integer was: ");
        put(max, 0);
        new_line;
        put("The smallest positive integer was: ");
        put(min_pos, 0);
        new_line;
    end if;
    if not (max_neg = 1) then
        put("Total negative numbers entered: ");
        put(count_neg, 0);
        new_line;
        put("The largest negative integer was: ");
        put(max_neg, 0);
        new_line;
        put("The smallest negative integer was: ");
        put(min, 0);
        new_line;
    end if;
end hw2_grayw7;
