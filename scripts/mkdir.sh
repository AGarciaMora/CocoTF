#!/bin/bash

while getopts 'p:' option; do
        case $option in
                p) project=$OPTARG;;
        esac
done

#project="testdata"
mkdir pipeline_results_${project}
mkdir pipeline_results_${project}/known_results
mkdir pipeline_results_${project}/bed_files
mkdir pipeline_results_${project}/motif_files
mkdir temp

