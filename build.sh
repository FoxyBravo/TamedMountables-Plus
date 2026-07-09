#!/bin/bash
# Build TamedMountables-Plus mod zip
# Usage: ./build.sh

if [ ! -d "bin" ]; then
    mkdir bin
fi

cd resources
zip -r ../bin/TamedMountables-Plus.zip ./*
cd ..
echo "Build complete: bin/TamedMountables-Plus.zip"
