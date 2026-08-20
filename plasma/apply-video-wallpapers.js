const plugin = "__PLUGIN__";
const landscape = "file://__LANDSCAPE__";
const portraitLeft = "file://__PORTRAIT_LEFT__";
const portraitRight = "file://__PORTRAIT_RIGHT__";
const desktopEntries = desktops().map(desktop => ({
    desktop,
    geometry: screenGeometry(desktop.screen)
}));

function centerX(geometry) {
    return geometry.x + geometry.width / 2;
}

function nearestLandscape(geometry) {
    const candidates = desktopEntries.filter(entry => entry.geometry.width >= entry.geometry.height);
    candidates.sort((a, b) =>
        Math.abs(centerX(a.geometry) - centerX(geometry)) -
        Math.abs(centerX(b.geometry) - centerX(geometry))
    );
    return candidates[0];
}

for (const {desktop, geometry} of desktopEntries) {
    let video = landscape;
    if (geometry.height > geometry.width) {
        const anchor = nearestLandscape(geometry);
        video = anchor && centerX(geometry) < centerX(anchor.geometry)
            ? portraitLeft
            : portraitRight;
    }
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
