`timescale 1ps/1ps

module voltage_divider16 (v_in, v_out);
    input real v_in;
    output real v_out [0:15];
    real R = 1;
    integer N = 15;
    integer i;

    always @(v_in) begin
        for (i = 0; i < N+1; i = i + 1) begin
            v_out[i] = v_in * (i) * R / (N * R);
        end
    end
endmodule

module mux16x1 (in, sel, out);
    input real in[0:15];
    input [3:0] sel;
    output real out;
    real out;

    always @(*) begin
        out = in[sel];
    end
endmodule

module dac4x1 (in, out);
    input [3:0] in;
    output real out;
    real out_vd[0:15];
    real v_in = 1.2;

    voltage_divider16 vd(v_in, out_vd);
    mux16x1 mux(out_vd, in, out);
endmodule

module test;
    real out[0:15];
    real v_in = 1.2;

    voltage_divider16 vd(v_in, out);

    real out_mux;
    wire [3:0] sel = 4'b0011;

    mux16x1 mux(out, sel, out_mux);

    initial begin
        integer i;
        #50;
        for (i = 0; i < 16; i = i + 1) begin
            $display("v_out[%0d] = %f", i, out[i]);
        end
        $display("out_mux = %f", out_mux);
    end

    reg [3:0] in_dac;
    real out_dac;

    dac4x1 dac(in_dac, out_dac);

    initial begin
        for (in_dac = 0; in_dac < 15; in_dac = in_dac + 1) begin
            #100;
            $display("output of dac = %f when input = %b", out_dac, in_dac);
        end
        in_dac = 4'b1111;
        #100;
        $display("output of dac = %f when input = %b", out_dac, in_dac);
        $finish;
    end
endmodule

