`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2020 02:07:56 AM
// Design Name: 
// Module Name: perceptron
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

module perceptron(data, label, clk, rst);
    
    input feature_array data;
    input bit           clk, rst;
    input bit           label;
    
    bit neuron_to_loss_func_ff;
    bit loss_func_ff_to_loss_funt;
    feature_array_with_bias   weights;
    feature_array_with_bias updated_weights;
    type_int        bias;
    feature_array_with_bias   data_with_bias;
    assign data_with_bias = {data, bias};
    
    initial begin
    weights[0] = 20;
    weights[1] = 30;
    weights[2] = 50;
    bias       = 1;
    end
    
    neuron               NEU(.data_inside_neuron(data_with_bias), .weights_inside_neuron(weights), .clk(clk), .rst(rst), .neuron_result(neuron_to_loss_func_FF));
    neuron_loss_func_FF  LOSS_FF(.d(neuron_to_loss_func_FF), .q(loss_func_ff_to_loss_funt), .clk(clk), .rst(rst)); 
    loss_funciton        LOSS_FUN(.last_weights(weights), .data(data_with_bias), .actual_label(label), .predicted_label(loss_func_ff_to_loss_funt), .updated_weights(weights));
//    assign weights = updated_weights;
endmodule
