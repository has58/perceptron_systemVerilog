`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Haider Ali Siddiquee
// 
// Create Date: 05/18/2020 02:56:28 PM
// Design Name: Artificial Neural Network Library
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
    parameter cols = 10; // Number of colunm in dataset
    parameter rows = 10; // number of rows in dataset
//    typedef struct  {
//                       int feature_array            [cols-1:0];
//                       int feature_array_with_bias  [cols:0];
//                    } data_type; 
    
    class array;
        int feature_array            [cols-1:0];
        int feature_array_with_bias  [cols:0];
    endclass: array
endpackage