# Blocky HASS theme

Based on the stylesheets I use regularly for my own projects, I've decided to port it over to Home Assistant. This theme gives a sleek, modern look to your Home Assistant interface with support for light and dark mode and, when I figure out how, support for custom primary, accent, tertiary and quaternary colors.

| Light mode                                                                                        | Dark mode                                                                                       |
| ------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| ![Light mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/light1.png?raw=true) | ![Dark mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/dark1.png?raw=true) |
| ![Light mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/light2.png?raw=true) | ![Dark mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/dark2.png?raw=true) |
| ![Light mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/light3.png?raw=true) | ![Dark mode](https://github.com/PixNyb/hass-theme-blocky/blob/main/docs/img/dark3.png?raw=true) |

## Usage

### HACS

[![Open your Home Assistant instance and open a repository inside the Home Assistant Community Store.](https://my.home-assistant.io/badges/hacs_repository.svg)](https://my.home-assistant.io/redirect/hacs_repository/?owner=PixNyb&repository=https%3A%2F%2Fgithub.com%2FPixNyb%2Fhass-theme-blocky&category=themes)

Or, follow these steps:

1. Go to the Community Store.
2. Search for `Blocky`.
3. Install the theme.

### Manual

1. Download the `blocky.yaml` file.
2. Place the file in your `config/themes` directory.
3. Add the following to your `configuration.yaml` if it's not already there:
    ```yaml
    frontend:
        themes: !include_dir_merge_named themes
    ```
4. Reload home assistant.
   1. Go to the **Settings** page.
   2. Click **System**.
   3. Press the power button in the top right corner.
   4. Click **Quick reload**.

### Enabling the theme

#### Individually

1. Open your Home Assistant profile.
2. Under **Themes**, select **Blocky**.

#### Globally

1. Go to the **Developer tools** page.
2. Click **ACTIONS**.
3. Under **Action**, select **frontend: Set the default theme**.
4. Under **Theme**, select **Blocky**.
5. Click **PERFORM ACTION**.