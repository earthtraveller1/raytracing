const Vec3 = @import("vector.zig").Vec3;
const raylib = @cImport(@cInclude("raylib.h"));
pub const Color = Vec3;

pub fn to_raylib_color(color: *const Color) raylib.Color {
    return .{
        .r = @intFromFloat(color.x * 255.99),
        .g = @intFromFloat(color.y * 255.99),
        .b = @intFromFloat(color.z * 255.99),
        .a = 255,
    };
}
