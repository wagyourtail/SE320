with ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO, ada.Float_Text_IO;

procedure hw8b_grayw7 is

    type Point is record
        x: Float;
        y: Float;
    end record;

    type Triangle is array(1..3) of Point;

    procedure get(p: out Point) is
        throwaway: Character;
        point_part: Float;
    begin
        get(throwaway);
        get(point_part);
        p.x := point_part;
        get(throwaway);
        get(point_part);
        p.y := point_part;
        get(throwaway);
    end get;

    procedure get(t: out Triangle) is
        p: Point;
    begin
        for i in t'range loop
            put("Enter vertex #");
            put(i, 0);
            put(": ");
            get(p);
            t(i) := p;
        end loop;
    end get;

    function centroid(t: Triangle) return Point is
        p: Point;
    begin
        p.x := (t(1).x + t(2).x + t(3).x) / 3.0;
        p.y := (t(1).y + t(2).y + t(3).y) / 3.0;
        return p;
    end centroid;

    procedure put(p: Point) is
    begin
        put("[");
        put(p.x, 0, Aft=>2, Exp=>0);
        put(", ");
        put(p.y, 0, Aft=>2, Exp=>0);
        put("]");
    end put;

    input_triangle: Triangle;
begin
    put("Enter vertices as [x.x, y.y]");
    new_line;
    get(input_triangle);
    put("The centroid is ");
    put(centroid(input_triangle));
end hw8b_grayw7;