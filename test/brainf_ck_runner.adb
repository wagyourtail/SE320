with ada.Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;

with Ada.Containers.Hashed_Maps;
use Ada.Containers;

procedure brainf_ck_runner is
    -- this is a minimal 2 tape programming language (data and program) named brainf***
    -- it has 8 commands:
    -- + - increment/decrement the current cell
    -- > < move the pointer to the right/left
    -- . , print/scan a character
    -- [ ] loop if the current cell is not 0
    -- every other character is ignored

    -- define those commands as an enum
    type Command is (Plus, Minus, Right, Left, Print, Scan, LoopStart, LoopEnd);

    -- define a map for the tape
    type Tape is new Hashed_Maps.Map(Integer, Unsigned_Byte_Integer);

    function get_command(c: Character) return Command is
    begin
        case c is
            when '+' => return Plus;
            when '-' => return Minus;
            when '>' => return Right;
            when '<' => return Left;
            when '.' => return Print;
            when ',' => return Scan;
            when '[' => return LoopStart;
            when ']' => return LoopEnd;
            when others => return null;
        end case;
    end get_command;

    function is_valid(c: Character) return Boolean is
    begin
        return c in "+-><.,[]";
    end is_valid;

    program: String;
    program_index: Integer := 1;

    tape: Tape;
    tape_index: Integer := 1;
begin
    put("Enter your program: ");
    get(program);

    -- loop through the program
    while program_index < program'length loop
        -- get next valid instruction

    end loop;
end brainf_ck_runner;