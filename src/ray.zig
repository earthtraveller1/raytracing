const vector_file = @import("vector.zig");
const Vec3 = vector_file.Vec3;
const Point3 = vector_file.Point3;

const Ray = struct {
    origin: Point3,
    direction: Vec3,

    pub fn init() Ray {
        return Ray{
            .origin = Point3{
                .x = 0.0,
                .y = 0.0,
                .z = 0.0,
            },
            .direction = Point3{
                .x = 0.0,
                .y = 0.0,
                .z = 0.0,
            },
        };
    }

    pub fn at(self: *const Ray, t: f64) Point3 {
        return self.origin.add(self.direction.multiply(t));
    }
};
