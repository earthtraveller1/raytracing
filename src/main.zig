const std = @import("std");
const raylib = @cImport(@cInclude("raylib.h"));

const color_file = @import("color.zig");
const Color = color_file.Color;

const image_width = 1280;
const image_height = 720;

pub fn main() !void {
    raylib.InitWindow(image_width, image_height, "Hello, World!");

    var canvas = try std.ArrayList(raylib.Color).initCapacity(std.heap.page_allocator, image_width * image_height);

    var y: u32 = 0;
    while (y < image_height) : (y += 1) {
        var x: u32 = 0;
        while (x < image_width) : (x += 1) {
            const image_height_f: f64 = @floatFromInt(image_height);
            const image_width_f: f64 = @floatFromInt(image_width);
            const y_f: f64 = @floatFromInt(y);
            const x_f: f64 = @floatFromInt(x);

            const color = Color{
                .x = x_f / (image_width_f - 1),
                .y = y_f / (image_height_f - 1),
                .z = 0.0,
            };

            try canvas.append(color_file.to_raylib_color(&color));
        }
    }

    const canvas_image = raylib.Image{
        .width = image_width,
        .height = image_height,
        .data = canvas.items.ptr,
        .format = raylib.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8,
        .mipmaps = 1,
    };

    const canvas_texture = raylib.LoadTextureFromImage(canvas_image);

    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();
        raylib.DrawTexture(canvas_texture, 0, 0, raylib.WHITE);
        raylib.EndDrawing();
    }

    raylib.CloseWindow();
}
