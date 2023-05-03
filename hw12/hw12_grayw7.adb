with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;
with ada.float_text_io; use ada.float_text_io;
with ada.io_exceptions;

with stack;

procedure hw12_grayw7 is

    package int_stack is new stack(integer);
    use int_stack;

    type point is record
        x: float;
        y: float;
    end record;

    procedure get(somePoint: out point) is
    begin
        put("Enter the floating point coordinates of a 2-D point as just x.xx y.yy: ");
        get(somePoint.x);
        get(somePoint.y);
    end get;

    procedure put(somePoint: point) is
    begin
        put("The point popped is [");
        put(somePoint.x, exp => 0, aft => 2);
        put(", ");
        put(somePoint.y, exp => 0, aft => 2);
        put("]");
    end put;

    package point_stack is new stack(point);
    use point_stack;

    type operation_type is (pushInteger, popInteger, pushPoint, popPoint, quit);
    package operation_io is new ada.text_io.enumeration_io(operation_type);
    use operation_io;

    operation: operation_type;
    someInteger: integer;
    somePoint: point;

begin

    loop
        begin
            put("What do you want to do (pushPoint, popPoint, pushInteger, or popInteger)? ");
            get(operation);
            case operation is
                when pushInteger =>
                    put(" Enter an integer: ");
                    get(someInteger);
                    push(someInteger);
                    new_line;
                when popInteger =>
                    someInteger := pop;
                    put(" Value popped was ");
                    put(someInteger, 0);
                    new_line(2);
                when pushPoint =>
                    get(somePoint);
                    push(somePoint);
                    new_line;
                when popPoint =>
                    somePoint := pop;
                    put(somePoint);
                    new_line(2);
                when quit =>
                    put(" Bye");
                    exit;
            end case;
        exception
            when int_stack.Empty_Stack | point_stack.Empty_Stack =>
                put_line(" Empty stack, cannot pop");
                new_line;
            when ada.io_exceptions.Data_Error =>
                put_line(" Not a legal operation");
                new_line;
        end;
    end loop;
end hw12_grayw7;