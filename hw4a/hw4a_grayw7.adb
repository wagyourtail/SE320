with ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;


procedure hw4a_grayw7 is

    subtype accepted_values is Integer range 0..50;

    input_count: Integer := 0;
    mistake_count: Integer := 0;

    running_average: Float := 0.0;

    input_value: accepted_values;
begin

    loop
        begin
            put("Enter a value between 0 and 50: ");
            get(input_value);
            exit when input_value = 0;
            running_average := (running_average * Float(input_count) + Float(input_value)) / Float(input_count + 1);
            input_count := input_count + 1;
        exception
            when CONSTRAINT_ERROR =>
                put("  Invalid input value; try again.");
                new_line;
                mistake_count := mistake_count + 1;
        end;
    end loop;

    put("While making ");
    put(mistake_count, 0);
    put(" mistakes, you ultimately entered ");
    put(input_count, 0);
    put(" good values; their average was ");
    put(running_average, aft=>0, exp=>0);

end hw4a_grayw7;