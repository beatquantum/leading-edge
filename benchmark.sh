#!/bin/bash

# Update system and install sysbench
sudo apt-get update
sudo apt-get install -y sysbench

echo "Starting Benchmark Tests..."

# CPU Test
echo "Running CPU Test..."
cpu_result=$(sysbench cpu --cpu-max-prime=20000 run | grep "total time:")

# Memory Test
echo "Running Memory Test..."
memory_result=$(sysbench memory run | grep "Operations performed:")

echo "Benchmark Test Results:"
echo $cpu_result
echo $memory_result

