//-----------------------------------------------------------------------------
// Module Name   : dbl_dabble_ext - binary-bcd converter (4 bcd digits)
// Project       : RTL Hardware Design and Verification using SystemVerilog
//-----------------------------------------------------------------------------
// Author        : John Nestor  <nestorj@lafayette.edu>
// Created       : Feb 2021, updated Feb 2022
//-----------------------------------------------------------------------------
// Description   : Functional description of an extended binary-bcd
//  converter using the double-dabble algorithm implemented in combinational
// logic.  This version converts a 13-bit input to four bcd digits output
// over a range between 0-8191.  Note that the $display calls are
// ignored during synthesis but illustrate the operation of the algorithm
//-----------------------------------------------------------------------------

module dbl_dabble_ext(input logic [12:0] b,
                  output logic [3:0] thou, hund, tens, ones);

logic [12:0] bs;

always_comb
    begin
        $display("dbl_dabble input: %d", b);
        bs = b;
        {thou, hund, tens, ones} = 16'h0;
        for (int i=1; i<=13; i++)
            begin
                if ((i > 3) && (ones >= 4'd5)) begin
                    ones = ones + 3;
                    $display("add3o %1d %4b %4b %4b %4b %8b", i, thou, hund, tens, ones, bs);
                end
                if ((i > 6) && (tens >= 4'd5)) begin
                    tens = tens + 3;
                    $display("add3o %1d %4b %4b %4b %4b %8b", i, thou, hund, tens, ones, bs);
                end
                if ((i > 9) && (hund >= 4'd5)) begin
                    hund = hund + 3;
                    $display("add3o %1d %4b %4b %4b %4b %8b", i, thou, hund, tens, ones, bs);
                end
                if ((i > 12) && (thou >= 4'd5)) begin
                    thou = thou + 3;
                    $display("add3o %1d %4b %4b %4b %4b %8b", i, thou, hund, tens, ones, bs);
                end
                {thou, hund, tens, ones, bs} = {thou, hund, tens, ones, bs} << 1;
            end
            $display("result    %d    %d   %d   %d", thou, hund, tens, ones);
    end

endmodule: dbl_dabble_ext
