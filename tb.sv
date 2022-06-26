module tb();
    reg             clk;
    reg             rst_n;

    // in interface
    reg     [7:0]   data_i;
    reg             valid_i;
    wire            ready_o;

    // out interface
    wire    [7:0]   data_o;
    reg             ready_i;
    reg             valid_o;

always  #5  clk =   ~clk;

initial begin
    clk     =   1'b0;
    rst_n   =   1'b0;
    #25;
    rst_n   =   1'b1;
    ready_i =   1'b1;
    valid_i =   1'b0;
    data_i  =   8'b0000_1000;
    #10;
    data_i  =   8'b0011_1100;
    valid_i =   1'b1;
    #10;
    data_i  =   8'b0100_1000;
    #10;
    valid_i =   1'b0;
    #10;
    data_i  =   8'b0010_0100;
    valid_i =   1'b1;
    ready_i =   1'b0;
    #20;
    ready_i =   1'b1;
    #10;
    valid_i =   1'b0;
    #20;
    $finish;
end

valid_ready inst_valid_ready(
    .clk        (clk),
    .rst_n      (rst_n),
    // in interface
    .data_i     (data_i),
    .valid_i    (valid_i),
    .ready_o    (ready_o),
    // out interface
    .data_o     (data_o),
    .ready_i    (ready_i),
    .valid_o    (valid_o)
);

endmodule
