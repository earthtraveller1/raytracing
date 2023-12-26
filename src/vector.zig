const std = @import("std");

pub const Vec3 = struct {
    x: f64,
    y: f64,
    z: f64,

    pub fn add(self: *const Vec3, other: *const Vec3) Vec3 {
        return Vec3{
            self.x + other.x,
            self.y + other.y,
            self.z + other.z,
        };
    }

    pub fn sub(self: *const Vec3, other: *const Vec3) Vec3 {
        return Vec3{
            self.x - other.x,
            self.y - other.y,
            self.z - other.z,
        };
    }

    pub fn multiply(self: *const Vec3, scalar: f64) Vec3 {
        return Vec3{
            self.x * scalar,
            self.y * scalar,
            self.z * scalar,
        };
    }

    pub fn divide(self: *const Vec3, scalar: f64) Vec3 {
        return Vec3{
            self.x / scalar,
            self.y / scalar,
            self.z / scalar,
        };
    }

    pub fn length(self: *const Vec3) f64 {
        std.math.sqrt(self.dot_self());
    }

    pub fn dot_self(self: *const Vec3) f64 {
        return self.x * self.x + self.y * self.y + self.z * self.z;
    }

    pub fn dot(self: *const Vec3, other: *const Vec3) f64 {
        return self.x * other.x + self.y * other.y + self.z * self.z;
    }

    pub fn cross(self: *const Vec3, other: *const Vec3) Vec3 {
        return Vec3{
            self.y * other.z - self.z * other.y,
            self.z * other.x - self.x * other.z,
            self.x * other.y - self.y * other.x,
        };
    }

    pub fn normalize(self: *const Vec3) Vec3 {
        return self.divide(self.length());
    }
};

pub const Point3 = Vec3;
