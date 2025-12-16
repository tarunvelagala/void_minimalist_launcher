# Return Zero - Implementation Plan

An ultra-minimalist, **icon-less**, distraction-free Flutter launcher focused on reducing phone usage through awareness and control.

## Design Philosophy

**Core Principles:**
- **Text-Only Interface**: No app icons, only app names in clean typography
- **Distraction-Free**: Minimal visual elements, maximum focus
- **Awareness First**: Prominent screen time and unlock count display
- **Intentional Usage**: Friction through minimalism encourages mindful app usage

## 🎯 MVP Features (Current Scope)

### 🏠 Minimalist Home Screen
- Large clock display (top-left)
- Usage stats display (top-right) - tap to open Digital Wellbeing
- Swipe-up gesture for app drawer
- Swipe-left gesture for opening specific app and it's selection in settings, default is camera
- Swipe-right gesture for opening specific app its selection in settings, default is phone
- If the app is lauched for the first time, show the instructions at the bottom of the screen i.e long press to open settings and swipe up for all apps. 
- if any any gesture is done then the instructions would be removed.
- Enable long press on the app in homescreen to make a selection of any other app from the app list.
- The app list on the home screen would be Placeholder in initial phase and on click it should make a toast "Long Press to select the App". 

### 🔍 Smart 3-Letter App Launcher
- Auto-open keyboard when app drawer appears
- Type 3 letters → if only 1 match, auto-launch instantly
- If 2+ matches → show filtered list
- Example: "gma" → Gmail opens automatically

### 📊 Usage Tracking & Awareness
- Real-time unlock count
- Daily screen time tracking
- Tap to open Digital Wellbeing for detailed stats

### 📱 App Management
- Text-only app list (no icons)

## 🚀 Future Enhancements

### At a glance widget
- "At a Glance" placeholder widget for upcoming events

### Feeds Screen Widgets
- Google Calendar integration
- Habit tracker (GitHub contribution style)
- Add more apps widgets
- Drag-and-drop to reorder widgets

### App & Website Blocker
- Block apps and websites that user specified in settings

### Notification Blocker & History
- Block notifications of that apps that user specified in settings.
- Show notification history

### 🎨 Wallpaper & Customization
- Curated minimal wallpapers (dark, nature, abstract)
- Motivating quotes overlay
- Daily quote rotation
- Fully customizable in settings

### ✍️ Advanced Gestures
- Draw custom gestures (e.g., draw "F" for Feeds)
- Configurable gesture actions
- Gesture recording in settings

## User Review Required

> [!IMPORTANT]
> **Commit Strategy**: Each feature will be implemented as atomic commits following professional SDE practices. Commits will be small, focused, and independently buildable where possible.

> [!WARNING]
> **Permissions Required**: This launcher requires sensitive permissions:
> - `QUERY_ALL_PACKAGES` - To list all installed apps
> - `PACKAGE_USAGE_STATS` - To track screen time and unlock count
> - `BIND_NOTIFICATION_LISTENER_SERVICE` - To manage notifications
> - `SYSTEM_ALERT_WINDOW` - For overlay features (if needed)

> [!NOTE]
> **Flutter Version**: The project will use the latest stable Flutter SDK. Please ensure Flutter is installed on your system.

---

## Proposed Changes

### Phase 1: Project Foundation & Setup

#### Commit 1.1: Initialize Flutter Project
- Run `flutter create --org com.vtkr --project-name return_zero .`
- Clean up default counter app code
- Set up basic folder structure:
  ```
  lib/
  ├── main.dart
  ├── core/
  │   ├── constants/
  │   ├── theme/
  │   └── utils/
  ├── features/
  └── services/
  ```

#### Commit 1.2: Configure Android Launcher Manifest
- Modify `android/app/src/main/AndroidManifest.xml`
- Add launcher intent filters to make app appear as launcher option
- Add basic permissions structure (will be expanded later)

#### Commit 1.3: Add Core Dependencies
- Update `pubspec.yaml` with essential dependencies:
  - `device_apps` - App management
  - `usage_stats` - Screen time tracking
  - `shared_preferences` - Settings storage
  - `provider` - State management
  - `intl` - Date/time formatting

---

### Phase 2: Home Screen - Core UI

> **Screen Focus**: Home Screen (Main Launcher Screen)

#### Commit 2.1: Create Minimalist Theme System
**Files**: `lib/core/theme/app_theme.dart`, `lib/core/theme/app_colors.dart`
- Monochrome color palette (OLED-friendly dark background, white/gray text)
- Clean sans-serif typography with large, readable sizes
- No colors, no gradients - pure minimalism
- Define text styles for clock, stats, and general UI

#### Commit 2.2: Implement Basic Home Screen Layout
**Files**: `lib/features/home/presentation/pages/home_page.dart`
- Create scaffold with dark background
- Add large time display (e.g., "8:11") as primary focus
- Add date display and battery percentage below time.
- No app icons or shortcuts - truly minimal
- Basic layout structure only (no functionality yet)

#### Commit 2.3: Add Battery Percentage Display
**Files**: `lib/features/home/presentation/widgets/clock_widget.dart`
- Add battery percentage below date
- Use `battery_plus` package to get battery level
- Format as "XX%" in minimal style
- Update in real-time

#### Commit 2.4: Position Clock Widget (Top Left)
**Files**: `lib/features/home/presentation/widgets/clock_widget.dart`, `lib/features/home/presentation/pages/home_page.dart`
- Extract clock, date, and battery into reusable widget
- Position in top-left corner of screen
- Implement real-time clock updates using `Timer`
- Format time and date using `intl` package

#### Commit 2.5: Add Usage Stats Display (Top Right)
**Files**: `lib/features/home/presentation/widgets/usage_stats_display.dart`
- Create usage stats widget (placeholder data for now)
- Display unlock count and screen time
- Position in top-right corner
- Center-align text/icons within the widget

#### Commit 2.6: Integrate Digital Wellbeing Tap Action
**Files**: `lib/features/home/presentation/widgets/usage_stats_display.dart`, `lib/services/digital_wellbeing_service.dart`
- Add tap gesture detector to usage stats widget
- Create service to launch Digital Wellbeing app
- Handle cases where Digital Wellbeing is not available
- Provide fallback to system usage settings

#### Commit 2.7: Add Basic Swipe Gesture Detection
**Files**: `lib/features/home/presentation/pages/home_page.dart`
- Implement `GestureDetector` for swipe gestures
- Swipe up → App drawer (to be implemented)
- Swipe down → Notifications panel (system)

#### Commit 2.8: Implement Swipe-Left/Right Quick App Launch
**Files**: `lib/features/home/presentation/pages/home_page.dart`, `lib/services/quick_launch_service.dart`
- Detect swipe-left and swipe-right gestures
- Create service to store and retrieve configured apps for each swipe direction
- **Set default apps**: Camera (swipe-left), Phone (swipe-right)
- Launch configured app on swipe gesture
- Handle cases where app is not installed
- Smooth launch animations

#### Commit 2.9: Add Home Screen App Placeholder
**Files**: `lib/features/home/presentation/widgets/home_app_placeholder.dart`
- Create placeholder widget for center of home screen
- Display text like "My App" or app name if configured
- Add tap gesture with toast: "Long Press to select the App"
- Minimal, text-based design

#### Commit 2.10: Implement Long-Press App Selection
**Files**: `lib/features/home/presentation/widgets/home_app_placeholder.dart`, `lib/features/home/presentation/pages/app_picker_page.dart`
- Detect long-press gesture on home screen placeholder
- Open app picker (text-only list of all apps)
- Save selected app to preferences
- Update placeholder to show selected app name
- Tap to launch selected app

#### Commit 2.11: Add First-Time Instructions
**Files**: `lib/features/home/presentation/widgets/instructions_widget.dart`, `lib/services/onboarding_service.dart`
- Check if app is launched for the first time
- Display instructions at bottom: "Long press to open settings and swipe up for all apps"
- Minimal, subtle text display
- Remove instructions after any gesture (swipe, long-press, tap)
- Store instruction dismissal state in preferences

---

### Phase 3: App Drawer Screen

> **Screen Focus**: App Drawer (Swipe-up from Home)

#### Commit 3.1: Create App List Service
**Files**: `lib/services/app_service.dart`
- Query installed apps using `device_apps` package
- Filter out system apps
- Sort alphabetically (A-Z)
- Return list of app names (no icons)
- Implement fuzzy search algorithm for smart matching

#### Commit 3.2: Build Text-Only App Drawer UI with First-Time Tip
**Files**: `lib/features/app_drawer/presentation/pages/app_drawer_page.dart`
- Simple vertical scrollable list of app names
- Clean, sans-serif font with ample spacing
- No icons, no colors - pure text
- Slide-up animation from home screen
- **First-time tip**: Show "Start typing an app name to auto launch it" on first launch
- Dismiss tip after user starts typing

#### Commit 3.3: Auto-Open Keyboard on Drawer Open
**Files**: `lib/features/app_drawer/presentation/pages/app_drawer_page.dart`
- Add search text field at top
- Auto-focus and open keyboard when drawer appears
- Implement real-time filtering as user types

#### Commit 3.4: Implement Smart 3-Letter Auto-Launch
**Files**: `lib/features/app_drawer/presentation/pages/app_drawer_page.dart`
- If user types 3 letters and only ONE app matches → auto-launch immediately
- If 2+ apps match → show filtered list
- Smart matching logic (e.g., "gma" → Gmail)

#### Commit 3.5: Implement App Launch Functionality
**Files**: `lib/services/app_service.dart`
- Launch app by package name
- Handle launch errors gracefully
- Smooth transition animations
- Close drawer after launch

---

### Phase 4: Usage Statistics & Tracking

> **Screen Focus**: Home Screen (Usage Stats Widget) + Feeds Screen

#### Commit 4.1: Request Usage Stats Permission
**Files**: `lib/services/usage_stats_service.dart`
- Check for usage stats permission
- Request permission with minimal UI
- Redirect to system settings if needed

#### Commit 4.2: Implement Unlock Count Tracker
**Files**: `lib/services/usage_stats_service.dart`
- Track screen unlock events
- Store daily count in preferences
- Reset count at midnight
- Provide unlock count to UI

#### Commit 4.3: Implement Screen Time Tracker
**Files**: `lib/services/usage_stats_service.dart`
- Query Android usage stats API
- Calculate daily screen time
- Format time (e.g., "1h 12m")

#### Commit 4.4: Connect Usage Stats to Home Screen Widget
**Files**: `lib/features/home/presentation/widgets/usage_stats_display.dart`
- Display real unlock count and screen time
- Update in real-time
- Handle permission denied state gracefully

---

### Phase 5: Settings Screen

> **Screen Focus**: Settings Screen

#### Commit 5.1: Create Main Settings Page
**Files**: `lib/features/settings/presentation/pages/settings_page.dart`
- Navigation from home screen (long-press or dedicated gesture)
- List of settings categories:
  - Quick Launch Apps (Swipe Gestures)
  - Home Screen App
  - Theme Preferences
  - About & Reset

#### Commit 5.2: Add Swipe Gesture App Configuration
**Files**: `lib/features/settings/presentation/pages/settings_page.dart`
- Section to configure swipe-left app (default: Camera)
- Section to configure swipe-right app (default: Phone)
- App picker UI (text-only list)
- Save selections to preferences
- Clear/reset gesture app assignments

#### Commit 5.3: Add Home Screen App Configuration
**Files**: `lib/features/settings/presentation/pages/settings_page.dart`
- Section to configure center home screen app
- Same app picker UI as swipe gestures
- Save selection to preferences
- Clear/reset option

#### Commit 5.4: Add Launcher Settings
**Files**: `lib/features/settings/presentation/pages/launcher_settings_page.dart`
- Set as default launcher option
- Theme preferences (OLED black vs dark gray)
- Reset all settings option
- Reset instructions/tips option



---

### Phase 6: Polish & UX Improvements

#### Commit 6.1: Add Smooth Animations
**Files**: Various
- Fade animations for screen transitions
- Slide animations for drawer and feeds
- Smooth keyboard show/hide
- Micro-animations for interactions

#### Commit 6.2: Implement Loading & Error States
**Files**: Various
- Minimal loading spinners or text ("Loading...")
- Error states with simple text messages
- Empty states ("No apps found", "No events today")
- Permission denied states

#### Commit 6.3: Optimize Performance
**Files**: Various
- Lazy loading for app list
- Efficient usage stats queries
- Minimize rebuilds with proper state management
- Test on low-end devices

---

### Phase 7: Documentation & CI/CD

#### Commit 7.1: Update README
**Files**: `README.md`
- Feature list (smart search, My Feeds, wallpapers with quotes)
- Design philosophy (minimalist, icon-less, distraction-free)
- Screenshots of each screen
- Setup instructions
- Permissions explanation

#### Commit 7.2: Add CI/CD for Release/Alpha
**Files**: `.github/workflows/build.yml`
- Build APK on push to `release` or `alpha` branch
- Generate release artifacts
- Auto-versioning based on git tags
- Upload to GitHub Releases

---

## 🔮 Future Enhancements Implementation

> **Note**: These features will be implemented after the MVP is complete and tested.

### Phase F1: App & Notification Blocking

> **Screen Focus**: App Drawer + Settings + Background Service

#### Commit F1.1: Create App Blocking Service
**Files**: `lib/services/app_blocking_service.dart`
- Store blocked apps list in `shared_preferences`
- Check if app is blocked before launch
- Provide methods to block/unblock apps

#### Commit F1.2: Add Blocking UI to App Drawer
**Files**: `lib/features/app_drawer/presentation/pages/app_drawer_page.dart`
- Long-press on app name to block/unblock
- Show dimmed text or strikethrough for blocked apps
- Display subtle warning when attempting to launch blocked app
- No popups - keep it minimal

#### Commit F1.3: Add Blocked Apps Settings Screen
**Files**: `lib/features/settings/presentation/pages/blocked_apps_settings_page.dart`
- List all blocked apps
- Toggle to unblock apps
- Text-only minimal UI

#### Commit F1.4: Create Notification Listener Service
**Files**: `android/app/src/main/kotlin/.../NotificationListenerService.kt`
- Implement Android `NotificationListenerService`
- Request notification access permission
- Basic notification interception

#### Commit F1.5: Implement Notification Blocking Logic
**Files**: `lib/services/notification_service.dart`
- Block notifications from specific apps
- Store blocked notification apps in preferences
- Communicate with native Android service

#### Commit F1.6: Add Notification Settings UI
**Files**: `lib/features/settings/presentation/pages/notification_settings_page.dart`
- Text-only list of apps with notification toggle
- Request notification access permission
- Minimal visual feedback

#### Commit F1.7: Implement Notification History
**Files**: `lib/features/settings/presentation/pages/notification_history_page.dart`
- Display history of blocked/dismissed notifications
- Show notification timestamp and app source
- Clear history option
- Minimal text-based UI

---

### Phase F2: Wallpaper & Quote System

> **Screen Focus**: Home Screen (Background) + Settings

#### Commit F1.1: Add Wallpaper Support to Home Screen
**Files**: `lib/features/home/presentation/widgets/wallpaper_background.dart`
- Implement background image support
- Default to solid dark color
- Load wallpaper from assets or storage
- Ensure text remains readable over wallpaper

#### Commit F1.2: Add Curated Wallpaper Assets
**Files**: `assets/wallpapers/`
- Add 10-15 minimal wallpapers (dark, nature, abstract)
- Optimize for mobile screens
- OLED-friendly dark images

#### Commit F1.3: Implement Quote Overlay System
**Files**: `lib/features/home/presentation/widgets/quote_overlay_widget.dart`
- Load motivating quotes from JSON file
- Display quote over wallpaper
- Daily rotation logic
- Ensure text readability

#### Commit F1.4: Add Wallpaper & Quote Settings
**Files**: `lib/features/settings/presentation/pages/wallpaper_settings_page.dart`
- Select from curated minimal wallpapers
- Enable/disable quote overlay
- Daily quote rotation toggle
- Preview wallpaper

#### Commit F1.5: Connect Wallpaper Settings to Home Screen
**Files**: `lib/features/home/presentation/pages/home_page.dart`
- Load selected wallpaper from preferences
- Apply quote overlay if enabled
- Handle wallpaper changes dynamically

---

### Phase F3: Advanced Gesture System

> **Screen Focus**: Home Screen + Settings

#### Commit F2.1: Add Gesture Drawing Library
**Files**: `pubspec.yaml`, `lib/features/gestures/gesture_recognizer.dart`
- Add `one_dollar_unistroke_recognizer` package
- Create gesture recognition service
- Set up gesture storage in preferences

#### Commit F2.2: Implement Custom Gesture Drawing
**Files**: `lib/features/gestures/gesture_recognizer.dart`, `lib/features/home/presentation/pages/home_page.dart`
- Recognize drawn gestures on home screen
- Support gestures like drawing "F" for Feeds
- Navigate to target screen on gesture match
- Visual feedback during drawing

#### Commit F2.3: Add Gesture Recording UI
**Files**: `lib/features/settings/presentation/pages/gesture_settings_page.dart`
- Record custom gestures in settings
- Assign gestures to actions (open Feeds, open specific app, etc.)
- Test and preview recorded gestures
- Delete/edit existing gestures

#### Commit F2.4: Add Gesture Configuration Options
**Files**: `lib/features/settings/presentation/pages/gesture_settings_page.dart`
- Enable/disable gesture system
- Adjust gesture sensitivity
- Manage gesture-to-action mappings
- Text-based minimal UI

---

## Design Reference

![User's Design Reference](/Users/C5404787/.gemini/antigravity/brain/dd8a10e6-d6b1-415d-9c54-301ec4877f9c/uploaded_image_1765648612701.jpg)

---

## Verification Plan

### Automated Tests
Each feature will include basic unit tests where applicable:
```bash
flutter test
```

### Manual Verification
After each major phase:
1. **Launcher Functionality**: Verify app shows in launcher selector
2. **App Management**: Test app listing, launch, and blocking
3. **Notifications**: Verify notification blocking works
4. **Usage Stats**: Check unlock count and screen time accuracy
5. **Gestures**: Test all gesture interactions
6. **Permissions**: Ensure all permissions are properly requested

### Device Testing
- Test on physical Android device (API 28+)
- Test launcher replacement flow
- Verify all features work as default launcher

### Build Verification
```bash
flutter build apk --release
```
- Ensure APK builds successfully
- Test installation on device
- Verify app size is reasonable for minimalist app
