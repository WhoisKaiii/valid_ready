module valid_ready(
    input           clk,
    input           rst_n,

    input   [7:0]   data_i,
    input           valid_i,
    output          ready_o,

    output  [7:0]   data_o,
    input           ready_i,
    output          valid_o
);

reg     [7:0]   data_o_r;
reg             valid_o_r;

assign  ready_o =   ready_i;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_o_r    <=  'b0;
    end else if (ready_i && valid_i) begin
        data_o_r    <=  data_i;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        valid_o_r   <=  1'b0;
    end else if (ready_o) begin
        valid_o_r   <=  valid_i;
    end
end

assign  data_o  =   data_o_r;
assign  valid_o =   valid_o_r;

endmodule
