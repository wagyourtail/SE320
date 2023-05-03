
generic
    type Element_Type is private;
package stack is

    procedure Push (E : Element_Type);
    function Pop return Element_Type;

    Empty_Stack: exception;

end stack;
