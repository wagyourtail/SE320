with ada.Text_IO;

use ada.Text_IO;

package date_io is

    subtype Year is Integer range 1900 .. 2100;
    type Month is (Jan, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, Dec);
    subtype Day is Integer range 1 .. 31;

    type Date is record
        y : Year;
        m : Month;
        d : Day;
    end record;

    function getDate return Date;

    function nextDay(dateIn: Date) return Date;

    procedure put(dateOut: Date);

private

    package MonthIO is new Enumeration_IO(Month);

    procedure flush;

    function maxDays(m: Month; y: Year) return Day;

end date_io;