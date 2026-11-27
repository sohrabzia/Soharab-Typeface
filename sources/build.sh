#!/bin/bash
set -e

echo "=== Building Soharab Typeface from Sources ==="

# Ensure directories exist
mkdir -p ../fonts/ttf ../fonts/variable

# Build variable font from design sources using fontmake if available
if command -v fontmake &> /dev/null; then
    echo "Compiling variable font using fontmake..."
    fontmake -m Soharab.designspace -o variable --output-path "../fonts/variable/Soharab[slnt,wght].ttf"
    fontmake -u Soharab-Regular.ufo -o ttf --output-path "../fonts/ttf/Soharab-Regular.ttf"
elif python3 -m fontmake --version &> /dev/null; then
    echo "Compiling variable font using python3 -m fontmake..."
    python3 -m fontmake -m Soharab.designspace -o variable --output-path "../fonts/variable/Soharab[slnt,wght].ttf"
    python3 -m fontmake -u Soharab-Regular.ufo -o ttf --output-path "../fonts/ttf/Soharab-Regular.ttf"
else
    echo "Note: fontmake is not installed. Copying existing binaries..."
    cp ../Soharab-VF.ttf "../fonts/variable/Soharab[slnt,wght].ttf"
    cp ../Soharab.ttf "../fonts/ttf/Soharab-Regular.ttf"
fi

# Sync root convenience copies
cp "../fonts/variable/Soharab[slnt,wght].ttf" ../Soharab-VF.ttf
cp "../fonts/variable/Soharab[slnt,wght].ttf" "../Soharab[slnt,wght].ttf"
cp "../fonts/ttf/Soharab-Regular.ttf" ../Soharab.ttf

# Sync Google Fonts onboarding package
if [ -d "../googlefonts/ofl/soharab" ]; then
    cp "../fonts/variable/Soharab[slnt,wght].ttf" "../googlefonts/ofl/soharab/Soharab[slnt,wght].ttf"
fi

echo "Build complete: Binaries updated in fonts/variable/ and fonts/ttf/"
