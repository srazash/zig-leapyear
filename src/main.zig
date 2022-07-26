const std = @import("std");
const time = std.time;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("The year is: {d}", .{year()});
}

fn year() !i64 {
    try return @divFloor(time.timestamp(), 31536000) + 1970;
}