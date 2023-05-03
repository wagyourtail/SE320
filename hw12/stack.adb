
package body stack is

    type Node is record
        Data : Element_Type;
        Next : access Node;
    end record;

    head: access Node := null;

    procedure Push(E: Element_Type) is
    begin
       head := new Node'(Data => E, Next => head);
    end push;

    function Pop return Element_Type is
       E: Element_Type;
    begin
         -- detect if empty
        if head = null then
            raise Empty_Stack;
        end if;
        E := head.Data;
        head := head.Next;
        return E;
     end pop;

end stack;