with ada.Text_IO, ada.Integer_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO;

procedure image_length is
    a: Integer := 743;
begin
    put(a);
    new_line;
    put(a'Image'Length);
    new_line;
end image_length;