var wallpaper = "file:///usr/share/wallpapers/MembraneOS/contents/images/1920x1080.svg";

for (var i = 0; i < desktops().length; i++) {
    var desktop = desktops()[i];
    desktop.wallpaperPlugin = "org.kde.image";
    desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    desktop.writeConfig("Image", wallpaper);
    desktop.writeConfig("FillMode", 2);
}

if (panels().length === 0) {
    var panel = new Panel();
    panel.location = "bottom";
    panel.height = 44;
    panel.addWidget("org.kde.plasma.kickoff");
    panel.addWidget("org.kde.plasma.icontasks");
    panel.addWidget("org.kde.plasma.marginsseparator");
    panel.addWidget("org.kde.plasma.systemtray");
    panel.addWidget("org.kde.plasma.digitalclock");
    panel.addWidget("org.kde.plasma.showdesktop");
}
