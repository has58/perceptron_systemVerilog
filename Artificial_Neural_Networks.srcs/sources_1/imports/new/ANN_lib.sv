`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2020 02:20:28 AM
// Design Name: 
// Module Name: ANN_lib
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

package ANN_lib;
    parameter number_of_rows = 2;
    parameter number_of_column = 2;
    parameter number_of_bits_in_int = 16;
    
//    typedef bit signed [number_of_bits_in_int - 1:0] [(number_of_column - 1):0] feature_array;
//    typedef bit signed [(number_of_column):0] [number_of_bits_in_int - 1:0]  feature_array_with_bias;
//    typedef bit  signed [number_of_bits_in_int - 1:0] type_int ;
//    typedef feature_array_with_bias [number_of_rows - 1:0] data_matrix_with_bias;
////  In label there are 9 bits because first 8 hold integer and last one hold the class value first
//    typedef bit signed [8:0] [number_of_rows - 1: 0] number_of_labels;
    typedef logic signed [number_of_bits_in_int - 1:0] [(number_of_column - 1):0] feature_array;
    typedef logic signed [(number_of_column):0] [number_of_bits_in_int - 1:0]  feature_array_with_bias;
    typedef logic  signed [number_of_bits_in_int - 1:0] type_int ;
    typedef feature_array_with_bias [number_of_rows - 1:0] data_matrix_with_bias;
//  In label there are 9 bits because first 8 hold integer and last one hold the class value first
    typedef logic signed [8:0] [number_of_rows - 1: 0] number_of_labels;

endpackage