cask "pomodoro" do
  version "0.1.0"
  sha256 "11e986a7195b53bc7223d5ccd69b2f2219c2c1533fcded1f1a7b531d0a49bfc6"

  url "https://github.com/lavals/mac-pomodoro-timer/releases/download/v#{version}/Pomodoro-#{version}.zip"
  name "Pomodoro"
  desc "Menu bar pomodoro timer that turns on macOS Focus while you work"
  homepage "https://github.com/lavals/mac-pomodoro-timer"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Pomodoro.app"

  # the app is ad-hoc signed and not notarized, so Gatekeeper would refuse the quarantined copy
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pomodoro.app"]
  end

  uninstall quit: "com.lavals.pomodoro"

  zap trash: ["~/Library/Preferences/com.lavals.pomodoro.plist"]
end
