const plugin = "__PLUGIN__";
const landscape = "file://__LANDSCAPE__";
const portrait = "file://__PORTRAIT__";

for (const desktop of desktops()) {
    const geometry = screenGeometry(desktop.screen);
    const video = geometry.height > geometry.width ? portrait : landscape;
    desktop.wallpaperPlugin = plugin;
    desktop.currentConfigGroup = ["Wallpaper", plugin, "General"];
    desktop.writeConfig("LastVideo", video);
    desktop.writeConfig("VideoUrls", JSON.stringify([{
        filename: video,
        enabled: true,
        duration: 0,
        customDuration: 0,
        playbackRate: 0,
        loop: false
    }]));
}
