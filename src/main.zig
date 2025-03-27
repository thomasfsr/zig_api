const std = @import("std");
const SocketConf = @import("config.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const socket = try SocketConf.Socket.init();
    try stdout.print("Server Addr: {any}\n", .{socket._address});
    var server = try socket._address.listen(.{});
    const connection = try server.accept();
    _ = connection;
}
