with ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;


procedure hw5a_grayw7 is
    type Piece is (
        b, -- blank
        RC, -- red checker
        BC, -- black checker
        RK, -- red king
        BK -- black king
    );

    board: array(1..8, 1..8) of Piece;

    black_count: Integer := 0;
    red_count: Integer := 0;

    valid: Boolean := true;

    package Piece_IO is new Enumeration_IO(Piece);
    use Piece_IO;
begin
    -- read in the board
    for y_pos in 1..8 loop
        for x_pos in 1..8 loop
            get(board(x_pos, y_pos));
        end loop;
    end loop;

    -- print board
    put_line("  |---------------------------------------|");
    for y_pos in 1..8 loop
        put("  | ");
        for x_pos in 1..8 loop
            put(board(x_pos, y_pos), 2);
            put(" | ");
        end loop;
        new_line;
        put_line("  |---------------------------------------|");
    end loop;

    -- check for legality
    new_line;
    for y_pos in 1..8 loop
        for x_pos in 1..8 loop
            -- pieces are only valid on black squares (bottom left is black square)
            -- thus, x+y must be odd
            if (x_pos + y_pos) mod 2 = 0 then
                if board(x_pos, y_pos) /= b then
                    put("   Square ");
                    -- to get squares coords from bottom left for output, invert y coord
                    put(9-y_pos, 0);
                    put(",");
                    put(x_pos, 0);
                    put_line(" should have been blank but wasn't.");
                    valid := false;
                end if;
            end if;
            -- add to piece count
            case board(x_pos, y_pos) is
                when RC =>
                    red_count := red_count + 1;
                when BC =>
                    black_count := black_count + 1;
                when RK =>
                    red_count := red_count + 2;
                when BK =>
                    black_count := black_count + 2;
                when b =>
                    null;
            end case;
        end loop;
    end loop;

    -- check for correct number of pieces
    new_line;
    if red_count > 12 then
        put_line("   There are too many red pieces on the board.");
        valid := false;
    end if;
    if black_count > 12 then
        put_line("   There are too many black pieces on the board.");
        valid := false;
    end if;

    new_line;
    new_line;
    -- print result
    put("This is ");
    if not valid then
        put("not ");
    end if;
    put_line("a legal board.");

end hw5a_grayw7;