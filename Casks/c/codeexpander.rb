cask "codeexpander" do
  version "4.3.7"
  sha256 "664da62e7dbc3875bc4633c401a82fb1bf5f65e6d71449b7d52931fdca5d2c8d"

  url "https://github.com/oncework/codeexpander/releases/download/#{version.major_minor}.x/CodeExpander-#{version}.dmg"
  name "CodeExpander"
  desc "Cloud synchronisation development tool"
  homepage "https://github.com/oncework/codeexpander"

  livecheck do
    url :url
    regex(/^CodeExpander[._-]v?(\d+(?:\.\d+)+)\.dmg$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  app "CodeExpander.app"

  zap trash: [
    "~/.codeexpander",
    "~/Documents/codeexpander",
    "~/Library/Logs/Codeexpander",
    "~/Library/Preferences/com.codeexpander.plist",
    "~/Library/Saved Application State/com.codeexpander.savedState",
  ]
end
