with ada.Text_IO, ada.Integer_Text_IO;

use ada.Text_IO, ada.Integer_Text_IO;


procedure hw3_grayw7 is
    prime: Boolean;
    mutable_number: Integer;
begin
    for number in 3..50 loop
        -- set the prime flag to true
        prime := true;
        -- copy number to mutable_number so we can modify it
        mutable_number := number;

        -- loop over all possible factors
        for denominator in 2..number-1 loop

            -- check if the denominator divides the number
            -- we know that the denominator will always be prime when this is true
            -- because the smaller primes are divided out first and so only the next prime
            -- will be able to divide the number
            if mutable_number mod denominator = 0 then

                -- initial set the prime flag to false and
                -- begin the non-prime factorization
                if prime then
                    put(" The factorization of ");
                    put(number, 0);
                    put(" is ");
                    put(denominator, 0);
                    mutable_number := mutable_number / denominator;
                    prime := false;
                end if;

                -- loop so we can factor by the same denominator multiple times
                while mutable_number mod denominator = 0 loop
                    put("*");
                    put(denominator, 0);
                    mutable_number := mutable_number / denominator;
                end loop;

                -- early exit if we have completely factored the number
                -- this should always happen by the time we reach the square root of the number
                if mutable_number = 1 then
                    exit;
                end if;
            end if;
        end loop;

        -- if we have not factored the number, it is prime
        if prime then
            put(number, 0);
            put(" is prime");
        end if;

        -- end line
        new_line;
    end loop;
end hw3_grayw7;