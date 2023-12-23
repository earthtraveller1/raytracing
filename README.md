# Ray Tracing

A port of the Ray Tracing in a Weekend tutorials into Zig.

## Quick Start

Here's a basic way to get started. It currently targets the latest stable release of Zig (0.11.0).

```bash
git submodule update --init
cd raylib
mkdir build
cd build
cmake .. -D CMAKE_BUILD_TYPE=Release
cmake --build .
cd ../..
zig build -Doptimize=ReleaseFast run
```
