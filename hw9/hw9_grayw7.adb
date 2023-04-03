with ada.Text_IO;
with ada.Integer_Text_IO;

use ada.Text_IO;
use ada.Integer_Text_IO;

procedure hw9_grayw7 is
    subtype Year is Integer range 1900 .. 2100;
    type Month is (Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, Dec);
    subtype Day is Integer range 1 .. 31;

    package MonthIO is new Enumeration_IO(Month);
    use MonthIO;

    type Date is record
        y : Year;
        m : Month;
        d : Day;
    end record;

    procedure flush is
        throwaway : Character;
        more: Boolean;
    begin
        loop
            get_immediate(throwaway, more);
            exit when not more;
        end loop;
        Ada.Text_IO.Skip_Line;
    end flush;

    function maxDays(m : Month; y : Year) return Day is
    begin
        case m is
            when Jan | Mar | May | July | Aug | Oct | Dec =>
                return 31;
            when Apr | June | Sept | Nov =>
                return 30;
            when Feb =>
                if (y mod 4 = 0 and y mod 100 /= 0) or y mod 400 = 0 then
                    return 29;
                else
                    return 28;
                end if;
        end case;
    end maxDays;

    function getDate return Date is
        dateOut : Date;
        comma : Character;
    begin
        put("Enter a date as mon dd, yyyy: ");
        begin
            get(dateOut.m);
        exception
            when others =>
                put_line("   Not a valid month; try again.");
                flush;
                return getDate;
        end;
        begin
            get(dateOut.d);
        exception
            when Constraint_Error =>
                put_line("   No month has that many days; try again.");
                flush;
                return getDate;
            when others =>
                put_line("   Not a valid day (not a number); try again.");
                flush;
                return getDate;
        end;
        get(comma);
        if comma /= ',' then
            put_line("   Expected a comma there between the day and the year; try again.");
            flush;
            return getDate;
        end if;
        begin
            get(dateOut.y);
        exception
            when others =>
                put_line("   Not a valid year; try again.");
                flush;
                return getDate;
        end;
        -- check for valid date
        if dateOut.d > maxDays(dateOut.m, dateOut.y) then
            if dateOut.d = 29 and dateOut.m = Feb then
                put("   ");
                put(dateOut.y, 0);
                put(" is not a leap year; try again.");
                new_line;
            else
                put("   Never that many days in ");
                put(dateOut.m);
                put("; try again.");
                new_line;
            end if;
            return getDate;
        end if;

        return dateOut;
--      exception
--          when others =>
--              put("Invalid date. Please try again.");
--              new_line;
--              return getDate;
    end getDate;

    function nextDay(dateIn: Date) return Date is
        newDate : Date;
    begin
        if dateIn.d < maxDays(dateIn.m, dateIn.y) then
            newDate.d := dateIn.d + 1;
            newDate.m := dateIn.m;
            newDate.y := dateIn.y;
        else
            if dateIn.m = Dec then
                newDate.d := 1;
                newDate.m := Jan;
                newDate.y := dateIn.y + 1;
            else
                newDate.d := 1;
                newDate.m := Month'Succ(dateIn.m);
                newDate.y := dateIn.y;
            end if;
        end if;
        return newDate;
    end nextDay;

    procedure put(dateOut : Date) is
    begin
        put("   The next day is ");
        put(dateOut.m);
        put(" ");
        put(dateOut.d, 0);
        put(", ");
        put(dateOut.y, 0);
    end put;

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
end hw9_grayw7;