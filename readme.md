# Aura TextUI

A beautiful, modern text UI system for FiveM with liquid glass aesthetics and smooth animations.

## Features

- **9 Color Variants**: Default, Success, Warning, Error, Info, Purple, Pink, Cyan, Orange
- **6 Positioning Options**: Center, Middle-Left, Middle-Right, Top-Left, Top-Center, Top-Right
- **FontAwesome Icon Support**: Display icons alongside your text
- **Permanent & Temporary**: Show text with duration or keep it visible until manually hidden
- **Progress Bar**: Visual indicator showing remaining display time
- **Smooth Animations**: Pop-in and fade-out effects optimized for FiveM
- **Standalone**: No framework dependencies required

## Installation

1. Download the resource
2. Place `aura-textui` in your server's resources folder
3. Add `ensure aura-textui` to your server.cfg

## Exports

### ShowTextUI
Display a text UI with customizable options.

```lua
exports['aura-textui']:ShowTextUI(text, position, type, duration, icon, permanent)
```

**Parameters:**
- `text` (string): The text to display
- `position` (string, optional): Position on screen - Default: `'center'`
- `type` (string, optional): Color variant - Default: `'default'`
- `duration` (number, optional): Display duration in milliseconds - Default: `0` (permanent)
- `icon` (string, optional): FontAwesome icon class - Default: `nil`
- `permanent` (boolean, optional): Keep visible until manually hidden - Default: `false`

### HideTextUI
Hide the currently displayed text UI.

```lua
exports['aura-textui']:HideTextUI()
```

## Positions

- `center` - Dead center of screen
- `middle-left` - Left edge, vertically centered
- `middle-right` - Right edge, vertically centered
- `top-left` - Top left corner
- `top-center` - Top center
- `top-right` - Top right corner

## Color Types

- `default` - White/transparent glass
- `success` - Green background
- `warning` - Amber/yellow background
- `error` - Red background
- `info` - Blue background
- `purple` - Purple background
- `pink` - Pink background
- `cyan` - Cyan background
- `orange` - Orange background

## Usage Examples

### Basic Usage
```lua
-- Simple text display
exports['aura-textui']:ShowTextUI('Hello World!')

-- With position and color
exports['aura-textui']:ShowTextUI('Success message!', 'top-center', 'success')

-- With icon and duration (5 seconds)
exports['aura-textui']:ShowTextUI('Loading...', 'center', 'info', 5000, 'fas fa-spinner')
```

### Advanced Usage
```lua
-- Permanent text UI (stays until manually hidden)
exports['aura-textui']:ShowTextUI('Press F to interact', 'middle-right', 'warning', 0, 'fas fa-hand-paper', true)

-- Temporary text with custom duration
exports['aura-textui']:ShowTextUI('Item received!', 'top-right', 'success', 3000, 'fas fa-gift')

-- Hide the current text UI
exports['aura-textui']:HideTextUI()
```

### Common Use Cases
```lua
-- Interaction prompts
exports['aura-textui']:ShowTextUI('Press E to enter vehicle', 'center', 'info', 0, 'fas fa-car', true)

-- Notifications
exports['aura-textui']:ShowTextUI('Money received: $500', 'top-right', 'success', 4000, 'fas fa-dollar-sign')

-- Warnings
exports['aura-textui']:ShowTextUI('Low health!', 'middle-left', 'error', 0, 'fas fa-heart', true)

-- Status updates
exports['aura-textui']:ShowTextUI('Connecting to server...', 'center', 'default', 0, 'fas fa-wifi', true)
```

## Test Commands

Use `/test_textui` with the following options to test the system:

- `/test_textui all` - Test all positions with random colors
- `/test_textui colors` - Cycle through all color variants
- `/test_textui icons` - Test all icon types
- `/test_textui permanent` - Show permanent text UI
- `/test_textui temporary` - Show temporary text UI
- `/test_textui hide` - Hide current text UI
- `/test_textui center` - Test center position (works with any position)

## Notes

- Only one text UI can be displayed at a time
- Showing a new text UI will automatically hide the previous one
- Permanent text UIs (duration = 0 or permanent = true) stay visible until manually hidden
- The progress bar only appears for temporary text UIs with a duration
- All animations are optimized.

## Support

For issues or questions, please create an issue on the GitHub repository.
