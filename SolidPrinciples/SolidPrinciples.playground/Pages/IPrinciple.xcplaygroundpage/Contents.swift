struct Music {
    var title: String
    var duration: Double
    var currentTime: Double
}

protocol Search {
    func search(music: String) -> String
}

protocol Download {
    func download(music: Music) -> Void
}

protocol Player {
    func playMusic() -> String
    func stopMusic() -> String
}

protocol Info {
    func info() -> String
}

protocol Record {
    func startRecording() -> String
    func stopRecording() -> String
}

struct MusicPlayer: Info, Player, Search {
    func playMusic() -> String {
        return "Playing music on Music player"
    }
    func stopMusic() -> String {
        return "Stopping music on Music player"
    }
    func info() -> String {
        return "Info about Music Player"
    }
    func search(music: String) -> String {
        return "Searching for: \(music)"
    }
}

struct PodcastPlayer: Player, Search, Download, Info {
    func playMusic() -> String {
        return "Playing music on Podcast player"
    }
    func stopMusic() -> String {
        return "Stopping music on Podcast player"
    }
    func info() -> String {
        return "Info about Podcast Player"
    }
    func search(music: String) -> String {
        return "Searching for: \(music)"
    }
    func download(music: Music) {
        
    }
}

struct VoicePlayer: Search, Player, Info{
    func playMusic() -> String {
        return "Playing music on Voice Player"
    }
    func stopMusic() -> String {
        return "Stopping music on Voice player"
    }
    func info() -> String {
        return "Info about Voice Player"
    }
    func search(music: String) -> String {
        return "Searching for: \(music)"
    }
}

struct LiveRadio: Player, Info,  Record{
    func playMusic() -> String {
        return "Playing music on Live Radio"
    }
    func stopMusic() -> String {
        return "Stopping music on Live Radio"
    }
    func info() -> String {
        return "Info about Live Radio"
    }
    func startRecording() -> String {
        return "Starting Recording..."
    }
    func stopRecording() -> String {
        return "Stopping Recording..."
    }
}

var players: [Player] = [
    LiveRadio(), MusicPlayer(), VoicePlayer(), PodcastPlayer()
]

for player in players {
    print(player.playMusic())
    print(player.stopMusic())
}

var radio = LiveRadio()
print(radio.startRecording())
print(radio.stopRecording())
