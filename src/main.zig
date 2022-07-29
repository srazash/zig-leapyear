const std = @import("std");
const time = std.time;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var currenYearLeapYear: bool = try boolLeapYear(try year());
    var currentYearNow: i64 = try year();
    const socJusEpochYear: i64 = 2015;
    var socJusCurrentYear: i64 =  currentYearNow - socJusEpochYear;

    // DEGUGGING CODE, IGNORE ME!
    //var debugval: i64 = @mod(try year(), 100);
    //try stdout.print("{d}\n\n", .{debugval});

    try stdout.print("The current year is {d}. ", .{try year()});

    if (currenYearLeapYear != true) {
        try stdout.print("This year is not a leap year.\n\n", .{});
    }

    try stdout.print("By the social justice calendar it is [CURRENT YEAR]+{d}.\n\n", .{socJusCurrentYear});

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
        }
    } else if (@mod(lyear, 100) != 0) {
        if (@mod(@intToFloat(f64, lyear), 4.0) == 0.0) {
            try stdout.print("{d} is a leap year.\n", .{lyear});
        }
    }
}

fn futureLeapYears(fyear: i64) !void {
    var xyear = fyear;
    xyear += 1;

    while (xyear <= fyear + 25) : (xyear += 1) {
        try isLeapYear(xyear);
    }
}

fn boolLeapYear (byear: i64) !bool {
    var bLeapYear: bool = false;

    if (@mod(byear, 100) == 0) {
        if (@mod(@intToFloat(f64, byear), 400.0) == 0.0) {
            bLeapYear = true;
        }
    } else if (@mod(byear, 100) != 0) {
        if (@mod(@intToFloat(f64, byear), 4.0) == 0.0) {
            bLeapYear = true;
        }
    }

    try return bLeapYear;
}