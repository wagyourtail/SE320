
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure operator is
    function weird(abc: integer) return integer is
    begin
        return (if abc > 7 then 1 else 0);
    end weird;
BEGIN
    null;
END operator;
