#!/bin/bash
iverilog  -o ./wave.o -y ../rtl ../rtl/pwm_capture.v \
../rtl/captuer_tx.v \
../rtl/neg_capture.v \
../rtl/pos_capture.v \
../3-testbench/pwm_capture_tb.sv \

vvp -n ./wave.o