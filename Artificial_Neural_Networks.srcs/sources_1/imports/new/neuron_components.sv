`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:46:57 AM
// Design Name: 
// Module Name: neuron_components
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import ANN_lib::*;

module multiplier( data, weights, multiplier_result);
    input  feature_array_with_bias data, weights ;
    // change the multiplication data type as in multiplication result
    // As multiplication result of two 8 bit number will be longer
    // for now we are considering integer*ingter give integer
    output feature_array_with_bias multiplier_result;
    
    genvar i;
    generate
        for (i = 0; i <= number_of_column; i++)
            begin
                assign multiplier_result[i] = data[i]*weights[i];
            end
    endgenerate
endmodule


module accumulator(accumulator_in, accumulator_out);
    input feature_array_with_bias accumulator_in;
    output type_int accumulator_out;
    int sum = 0 ;
    always@(*)
        begin
            for(int i = 0 ; i <= number_of_column; i++)
                begin
                    sum += accumulator_in[i];  
                end
        end
     assign accumulator_out = sum;
endmodule

module sign_activation_function(sign_in, sign_out);
    input  type_int sign_in;
    output bit sign_out;
    
    assign sign_out = (sign_in[number_of_bits_in_int - 1]) ? 1'b0:1'b1;
endmodule

module relu_activation_function(relu_in, relu_out);
    input  type_int relu_in;
    output type_int relu_out;
    
    assign relu_out = (relu_in[number_of_bits_in_int - 1] ) ? 1'b0:relu_in;
    
    
endmodule

module multiplier_FF(d, q, clock, reset);
    input  feature_array_with_bias [1:0]  d;
    output feature_array_with_bias [1:0]  q;
    input bit clock, reset;
    
    always @(posedge clock or posedge reset)
        begin
            if (reset)
                q <= 1'b0;
            else
                if (clock)
                   q <= d;
        end
endmodule

module accumulator_FF(d, q, clock, reset);
    input  feature_array_with_bias d;
    output feature_array_with_bias q;
    input bit clock, reset;
    
    always @(posedge clock or posedge reset)
        begin
            if (reset)
                q <= 1'b0;
            else
                if (clock)
                   q <= d;
        end
endmodule

module activation_function_FF(d, q, clock, reset);
    input  type_int d;
    output type_int q;
    input bit clock, reset;
    
    always @(posedge clock or posedge reset)
        begin
            if (reset)
                q <= 1'b0;
            else
                if (clock)
                   q <= d;
        end
endmodule

module loss_funciton(data, actual_label, weights, predicted_label, updated_weights);
    
    input  feature_array_with_bias data, weights;
    input  bit                     actual_label;
    input  bit                     predicted_label;
    output feature_array_with_bias updated_weights;
    
    genvar i;
    generate
        for (i = 0; i <= number_of_column; i++)
            begin
//              here our learning rate is 1
                assign updated_weights[i] = weights[i] + (actual_label - predicted_label)*data[i];
            end
    endgenerate   
endmodule

module neuron_loss_func_FF(d, q, clk, rst);
    
    input bit d, clk, rst;
    output   bit q;
    
    always @(posedge clk or posedge rst)
        begin
            if (rst)
                q <= 1'b0;
            else
                if (clk)
                   q <= d;
        end
endmodule