`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 07:17:25 PM
// Design Name: 
// Module Name: neuron
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
module neuron( data_inside_neuron, weights_inside_neuron, clk, rst, neuron_result);
    
    input bit clk;
    input bit rst;
    input feature_array_with_bias data_inside_neuron, weights_inside_neuron;
//    output type_int neuron_result;
    output bit neuron_result;

    feature_array_with_bias [1: 0] to_MUL_FF;
    assign to_MUL_FF = {data_inside_neuron, weights_inside_neuron};
    feature_array_with_bias [1: 0] MUL_FF_to_multiplier; // wire between multiplier flip flop to multiplier
    feature_array_with_bias multiplier_to_accumulator_ff; // wire between multiplier flip flop to multiplier
    feature_array_with_bias ACC_FF_to_accumulator;
    type_int accumulator_to_activation_function_FF;
    type_int activation_function_FF_to_activation_function;

//  All the instances from multiplicaiton flip flop to sign_activation_function
    multiplier_FF          MUL_FF(.d(to_MUL_FF), .clock(clk), .reset(rst), .q(MUL_FF_to_multiplier));
    multiplier             MUL   (.data(MUL_FF_to_multiplier[0]), .weights(MUL_FF_to_multiplier[1]), .multiplier_result(multiplier_to_accumulator_ff));
    accumulator_FF         ACC_FF(.d(multiplier_to_accumulator_ff), .q(ACC_FF_to_accumulator), .clock(clk), .reset(rst));
    accumulator            ACC   (.accumulator_in(ACC_FF_to_accumulator), .accumulator_out(accumulator_to_activation_function_FF));
    activation_function_FF ACT_FUN_FF(.d(accumulator_to_activation_function_FF), .q(activation_function_FF_to_activation_function), .clock(clk), .reset(reset));
    sign_activation_function SIGN_AC (.sign_in(activation_function_FF_to_activation_function), .sign_out(neuron_result));
endmodule
