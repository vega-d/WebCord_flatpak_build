#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
cd $SCRIPT_DIR

rm -rf WebCord*/
rm ../WebCord_*.tar.gz ./latest* ./v*.tar.gz*