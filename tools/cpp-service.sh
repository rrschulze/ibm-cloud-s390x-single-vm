#!/bin/bash
while :
do
	/home/labuser/source/opentelemetry-cpp/build/examples/otlp/example_otlp_http 
	/home/labuser/source/opentelemetry-cpp/build/examples/otlp/example_otlp_http_log
	/home/labuser/source/opentelemetry-cpp/build/examples/otlp/example_otlp_http_metric        
    
	sleep 1
done