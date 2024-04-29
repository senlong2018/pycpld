module pwm_capture_tb;
reg pwm_input;
reg clk;
reg rst_n;
reg enable;
reg tx_complete;
reg capture_tx_rst;
reg bps_start_t;
wire tx_start;
wire [7:0] tx_data;

always begin
    #10 clk = ~clk;
end

initial begin
    clk = 0;
    rst_n = 0;
    #20;
    rst_n = 1;
end

pwm_capture pwm_capture_inst(
    /*input          */ .pwm_input(pwm_input),
    /*input          */ .clk(clk),
    /*input          */ .rst_n(rst_n),
    /*input          */ .enable(enable),
    /*input          */ .tx_complete(tx_complete),
    /*input          */ .capture_tx_rst(capture_tx_rst),
    /*input          */ .bps_start_t(bps_start_t),
    /*output         */ .tx_start(tx_start),
    /*output[7:0]    */ .tx_data(tx_data)
);

 initial begin
    $dumpfile("../2-gtkdebug/wave.vcd");
    $dumpvars(0,pwm_capture_tb);
    #1000 $finish;
  end

endmodule