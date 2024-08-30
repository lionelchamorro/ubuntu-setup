# GNOME Environment Setup Script

This script automates the installation and configuration of a customized GNOME desktop environment. Follow the steps below to set up your system.

## Prerequisites

Ensure you have the following files in the `~/Programs/` directory:
- `GTK-Themes.zip`: Contains GTK themes.
- `icon-themes.zip`: Contains icon themes.
- `cursors-theme.zip`: Contains cursor themes.
- `fonts.zip`: Contains fonts.
- `wallpapers.zip`: Contains wallpapers.
- `conky-config.zip`: Configuration for Conky.
- `cava-config.zip`: Configuration for Cava.
- `neofetch-config.zip`: Configuration for Neofetch.
- `plymouth-theme.zip`: Plymouth boot theme.
- `ubuntu-desktop-settings.zip`: GNOME desktop settings.
- `gnome-extensions.zip`: GNOME shell extensions.

## Installation

1. Clone this repository or copy the `install_gnome_setup.sh` script to your machine.
2. Ensure the required zip files are present in the `~/Programs/` directory.
3. Run the installation script:
   ```bash
   bash install_gnome_setup.sh
   ```
4. Follow any additional instructions provided by the script.

## Post-Installation

After running the script:
- Your GNOME environment should have the Orchis theme applied.
- Essential GNOME applications and extensions will be installed.
- Flatpak applications like Amberol, Motrix, Blanket, Spotube, and Extension Manager will be installed and configured.
- Conky, Cava, and Neofetch will be set up with custom configurations.
- The Plymouth boot theme will be configured.

## Notes

- Visit the [GNOME Extensions Website](https://extensions.gnome.org/extension/53/pomodoro/) to manually install the Pomodoro extension.
- If you wish to modify the theme or icon settings, you can adjust the files in the `~/.themes` or `~/.local/share/icons` directories.

## Troubleshooting

If you encounter any issues, ensure all required files are correctly placed in the `~/Programs/` directory and re-run the script. For any specific errors, consult the script output for more details.

