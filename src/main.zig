const std = @import("std");
const raylib = @cImport(@cInclude("raylib.h"));

const image_width = 800;
const image_height = 600;

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

            const red: f64 = y_f / image_height_f;
            const green: f64 = x_f / image_width_f;

            const color = raylib.Color{
                .r = @intFromFloat(red * 255.99),
                .g = @intFromFloat(green * 255.99),
                .b = 255,
                .a = 255,
            };

            try canvas.append(color);
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
