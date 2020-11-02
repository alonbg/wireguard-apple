import libwg_go

struct WireGuardKit {
    var text = "Hello, World!"
}

func printWireGuardKitVersion() {
    let swiftVersionString = wgVersion().flatMap { String(cString: $0) }
    print("WIREGUARD_GO_VERSION = \(WIREGUARD_GO_VERSION)")
    print("wgVersion() = \(swiftVersionString ?? "nil")")
}
