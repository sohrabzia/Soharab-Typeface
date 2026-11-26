#!/bin/bash
set -e

echo "Building Soharab font release..."

mkdir -p ../fonts/ttf ../fonts/variable

cp ../Soharab.ttf ../fonts/ttf/Soharab-Regular.ttf
cp ../Soharab-VF.ttf "../fonts/variable/Soharab[slnt,wght].ttf"

echo "Build successful: Font binaries generated in fonts/ttf and fonts/variable."
