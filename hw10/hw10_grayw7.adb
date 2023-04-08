with ada.Text_IO;
with ada.Integer_Text_IO;

use ada.Text_IO;
use ada.Integer_Text_IO;

with Date_IO;
use Date_IO;

procedure hw10_grayw7 is

    procedure get(controlChar: out Character) is
    begin
        Ada.Text_IO.get(controlChar);
        if controlChar /= 'y' and controlChar /= 'n' then
            put("Not a valid control input.  Again ? [y/n] ");
            flush;
            get(controlChar);
        end if;
    end get;

    controlChar : Character := 'y';
begin
    put_line("Enter dates as month day, year.  Months are Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, and Dec.");
    while controlChar = 'y' loop
        put(nextDay(getDate)); -- gets a date from the user and then prints the next day's date
        new_line(2);
        put("  Again? [y/n]: ");
        get(controlChar);
        new_line;
    end loop;
end hw10_grayw7;