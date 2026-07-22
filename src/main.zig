const std = @import("std");

pub fn main(init: std.process.Init) !void {
    var stdout_buf: [2048]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(init.io, &stdout_buf);
    const stdout = &stdout_writer.interface;

    const t = try init.minimal.args.toSlice(init.arena.allocator());

    for (t) |arg| {
        try stdout.print("{s}\n", .{arg});
    }
    try stdout.flush();
}
