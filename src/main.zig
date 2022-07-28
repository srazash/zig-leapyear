const std = @import("std");
const time = std.time;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    var debugval: i64 = @mod(try year(), 100);
    try stdout.print("{d}\n\n", .{debugval});

    try stdout.print("The year is {d}.\n", .{year()});
    try stdout.print("(It's not the future, just the present.)\n\n", .{});

    try isLeapYear(try year());
    try futureLeapYears(try year());
}

fn year() !i64 {
    const secsInYear: i64 = 31536000;
    const epochYear: i64 = 1970;
    try return @divFloor(time.timestamp(), secsInYear) + epochYear;
}

fn isLeapYear(lyear: i64) !void {
    const stdout = std.io.getStdOut().writer();

    if (@mod(lyear, 100) == 0) {
        if (@mod(@intToFloat(f64, lyear), 400.0) == 0.0) {
            try stdout.print("{d} is a leap year.\n", .{lyear});
        } else {
            try stdout.print("{d} is not a leap year.\n", .{lyear});
        }
    } else {
            try stdout.print("{d} is not a leap year.\n", .{lyear});

    }
}

fn futureLeapYears(fyear: i64) !void {
    var xyear = fyear;
    xyear += 1;

    while (xyear <= fyear + 25) : (xyear += 1) {
        try isLeapYear(xyear);
    }
}