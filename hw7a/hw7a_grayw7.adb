with ada.Text_IO;

use ada.Text_IO;

procedure hw7a_grayw7 is
    input: string(1..10) := (others => ' ');
    length: integer;
    palindrome: boolean := true;
    temp: character;
begin
    put("Enter a string: ");
    get_line(input, length);

--      put(length'Image);
--      new_line;

    for i in 1..length/2 loop
--          put(i'Image);
--          put("  ");
        if input(i) /= input(length - i + 1) then
            palindrome := false;
            temp := input(i);
            input(i) := input(length - i + 1);
            input(length - i + 1) := temp;
--              put(input);
--              new_line;
        end if;
    end loop;

    put("after reversal, the string is ");
    put(input(1..length));
    put(", so it");
    if palindrome then
        put(" is a palindrome");
    else
        put("'s not a palindrome");
    end if;
    new_line;
end hw7a_grayw7;