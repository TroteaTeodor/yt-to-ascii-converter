# 🎥 yt-to-ascii.sh - YouTube to ASCII Video with Audio

A fun little shell script to download and play YouTube videos as **ASCII art** in your terminal with **synchronized audio**.

> Converts any YouTube video to a terminal-friendly experience using `yt-dlp`, `ffmpeg`, and `mplayer` with `caca-utils`.

![Demo of yt-to-ascii.sh](demo.gif)

---

## 📽 Features

- Downloads the best quality video/audio from YouTube.
- Converts and scales it to your terminal’s ASCII art resolution.
- Supports multiple resolutions and rotation angles.
- Option to clean up downloaded files afterward.

---

## 🧰 Requirements

Make sure you have the following installed:

- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)
- [`ffmpeg`](https://ffmpeg.org/)
- [`mplayer`](http://www.mplayerhq.hu/)
- [`caca-utils`](https://github.com/cacalabs/libcaca) (for ASCII video output)

---

## 🖥️ How to Run

### Windows (WSL recommended)

> ⚠️ This script is designed for Unix-like systems. You can run it on Windows using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

```bash
# Open WSL terminal (Ubuntu recommended)
sudo apt update && sudo apt install -y yt-dlp ffmpeg mplayer caca-utils
chmod +x yt-to-ascii.sh
./yt-to-ascii.sh
```

### macOS

```bash
brew install yt-dlp ffmpeg mplayer libcaca
chmod +x yt-to-ascii.sh
./yt-to-ascii.sh
```

### Linux

#### Ubuntu / Debian

```bash
sudo apt update
sudo apt install -y yt-dlp ffmpeg mplayer caca-utils
chmod +x yt-to-ascii.sh
./yt-to-ascii.sh
```

#### Fedora / AlmaLinux / RHEL

```bash
sudo dnf install -y yt-dlp ffmpeg mplayer libcaca
chmod +x yt-to-ascii.sh
./yt-to-ascii.sh
```

#### Arch / Manjaro

```bash
sudo pacman -S yt-dlp ffmpeg mplayer libcaca
chmod +x yt-to-ascii.sh
./yt-to-ascii.sh
```

---

## 🚀 Usage

1. Run the script:
   ```bash
   ./yt-to-ascii.sh
   ```

2. Enter a YouTube video URL.

3. Choose a resolution:
   - 1 = 120×36 (Medium)
   - 2 = 160×50 (High)
   - 3 = 200×60 (Ultra)
   - 4 = Custom (e.g., 192:48)

4. Choose rotation:
   - 0 = No rotation
   - 1 = 90° Clockwise
   - 2 = 90° Counterclockwise
   - 3 = 180°

5. Watch your ASCII video play with sound! 🎶

6. Choose whether to delete temporary files.

---

## 📎 Notes

- `mplayer` uses `alsa` by default in this script. If you're using PulseAudio, change `-ao alsa` to `-ao pulse`.
- Terminal should be large enough to render chosen resolution.
- Some systems may need to run with `sudo` depending on audio/video device permissions.

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## 🙃 Just for Fun

Watching YouTube in ASCII might not be practical, but it sure is entertaining.

```
█▓▒░ Enjoy the retro vibes! ░▒▓█
```