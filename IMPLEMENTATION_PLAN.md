# Void Launcher - Implementation Plan

An ultra-minimalist, **icon-less**, distraction-free Flutter launcher focused on reducing phone usage through awareness and control.

## Design Philosophy

**Core Principles:**
- **Text-Only Interface**: No app icons, only app names in clean typography
- **Distraction-Free**: Minimal visual elements, maximum focus
- **Awareness First**: Prominent screen time and unlock count display
- **Intentional Usage**: Friction through minimalism encourages mindful app usage

## ✨ Feature Highlights

### 🔍 Smart 3-Letter App Launcher
- Auto-open keyboard when app drawer appears
- Type 3 letters → if only 1 match, auto-launch instantly
- If 2+ matches → show filtered list
- Example: "gma" → Gmail opens automatically

### 📊 My Feeds - Widget Dashboard
- Floating button on home screen
- Slide-up panel with:
  - Usage statistics (unlock count, screen time)
  - Top apps breakdown (text-only)
  - Custom widgets from other apps (calendar, weather, notes)
- **Drag-and-drop to organize**: Reorder widgets and stats cards
- All in a minimal, feed-style layout

### 🖼️ Minimal Wallpapers with Quotes **(Optional)**
- Curated minimal wallpapers (dark, nature, abstract)
- Motivating quotes overlay
- Daily quote rotation
- Fully customizable in settings

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

## Proposed Changes

### Phase 1: Project Foundation

#### [NEW] Flutter Project Structure
Initialize Flutter project with proper package structure:
```
void-minimalist-launcher/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   └── utils/
│   ├── features/
│   │   ├── home/
│   │   ├── app_drawer/
│   │   ├── app_blocking/
│   │   ├── notification_blocking/
│   │   ├── usage_stats/
│   │   └── gestures/
│   ├── services/
│   └── widgets/
├── android/
├── pubspec.yaml
└── README.md
```

**Commit 1**: Initialize Flutter project
- Run `flutter create --org com.vtkr --project-name return_zero .`
- Clean up default counter app code

**Commit 2**: Configure Android manifest for launcher
- Modify `android/app/src/main/AndroidManifest.xml`
- Add launcher intent filters
- Set required permissions

**Commit 3**: Add core dependencies
- Add `pubspec.yaml` dependencies:
  - `device_apps` - App management
  - `usage_stats` - Screen time tracking
  - `shared_preferences` - Settings storage
  - `provider` - State management

---

### Phase 2: Core UI Framework

#### [NEW] Ultra-Minimalist Theme System
**Commit 4**: Create distraction-free theme
- Monochrome color palette (dark background, white/gray text)
- Clean sans-serif typography (large, readable)
- OLED-friendly dark theme
- No colors, no gradients - pure minimalism

#### [NEW] Home Screen Layout
**Commit 5**: Implement home screen with large clock
- Large time display (primary focus, like 8:11)
- Date and battery info (small, subtle)
- Wallpaper support
- **No app icons or shortcuts** - truly minimal

**Commit 6**: Add prominent screen time indicator
- Screen time widget at top ("1h 12m" format)
- Tap to see detailed usage stats
- Today's unlock count display

**Commit 7**: [OPTIONAL] Add minimal wallpaper selector with quotes
- Curated minimal wallpapers (dark, nature, abstract)
- Motivating quotes overlay
- Daily quote rotation
- Fully customizable in settings

**Commit 8**: Add gesture detection framework
- Swipe up for app drawer (with auto-keyboard)
- Swipe down for quick settings
- Floating button for My Feeds

---

### Phase 3: App Management

#### [NEW] Text-Only App Drawer with Smart Search
**Commit 9**: Create app list service
- Query installed apps
- Filter system apps
- Sort alphabetically (A-Z)
- **No icon loading** - text names only
- Fuzzy search algorithm for quick matching

**Commit 10**: Build icon-less app drawer UI with auto-keyboard
- Simple vertical text list (app names)
- Clean, monospace or sans-serif font
- Ample spacing between items
- No icons, no colors - pure text
- **Auto-open keyboard** when app drawer opens

**Commit 11**: Implement smart 3-letter app launch
- If user types 3 letters and only ONE app matches → auto-launch
- If 2+ apps match → show filtered list
- Real-time filtering as user types
- Smart matching (e.g., "gma" → Gmail)

**Commit 12**: Implement app launch
- Tap on app name to launch
- Smooth transitions
- Error handling

#### [NEW] App Blocking Feature
**Commit 13**: Create app blocking service
- Store blocked apps list
- Check if app is blocked before launch
- Show subtle warning when attempting to launch

**Commit 14**: Add minimal app blocking UI
- Long-press on app name to block/unblock
- Dimmed text or strikethrough for blocked apps
- Settings screen for blocked apps list
- No popups - keep it minimal

---

### Phase 4: Notification Management

#### [NEW] Notification Listener Service
**Commit 15**: Create notification listener
- Implement `NotificationListenerService`
- Request notification access permission
- Basic notification interception

**Commit 16**: Implement notification blocking
- Block notifications from specific apps
- Store blocked notification apps
- Permission request UI (minimal)

**Commit 17**: Notification settings UI
- Text-only list of apps with notification access
- Toggle notification blocking per app
- Minimal visual feedback

---

### Phase 5: Usage Tracking & My Feeds

#### [NEW] Usage Statistics Service
**Commit 18**: Request usage stats permission
- Permission check and request
- Settings redirect UI (minimal)

**Commit 19**: Implement unlock count tracker
- Track screen unlock events
- Store daily count
- Reset at midnight

**Commit 20**: Implement screen time tracker
- Query usage stats API
- Calculate daily screen time
- Per-app usage stats

#### [NEW] My Feeds Screen - Widget Dashboard
**Commit 21**: Create floating "My Feeds" button
- Floating action button (minimal, subtle)
- Shows on home screen
- Slide-up panel animation

**Commit 22**: Build My Feeds screen UI with drag-and-drop
- Usage stats section (unlock count, screen time) as cards
- Text-only breakdown of top apps
- Today's usage list (sorted by time)
- **Drag-and-drop support**: Long-press and drag to reorder cards
- Smooth reordering animations
- **No graphs or fancy charts** - just the numbers

**Commit 23**: Add widget integration to My Feeds
- Allow adding widgets from other apps
- Widget selection UI (minimal)
- Arrange widgets in feed-style layout
- **Drag to reorder widgets** within the feed
- Support common widgets (calendar, weather, notes, etc.)
- Persist widget order in preferences

---

### Phase 6: Gestures

#### [NEW] Advanced Gesture System
**Commit 24**: Implement custom gestures
- Swipe left/right for quick actions
- Pinch gestures (optional)
- Long-press gestures

**Commit 25**: Gesture configuration
- Text-based settings for gesture actions
- Enable/disable gestures
- Custom gesture mappings

---

### Phase 7: Polish & Settings

#### [NEW] [feeds_page.dart](file:///Users/C5404787/workplace/personal/return_zero/lib/features/feeds/presentation/pages/feeds_page.dart)
- **Purpose**: View historic usage stats and add widgets (habit tracker, pomo, etc.).
- **Layout**: Scaffold with "Feeds" title for now.
- **Interaction**: Accessed by tapping `UsageStatsDisplay`.

#### [MODIFY] [usage_stats_display.dart](file:///Users/C5404787/workplace/personal/return_zero/lib/features/home/presentation/widgets/usage_stats_display.dart)
- **Components**:
    - Unlock Count and Screen Time.
- **Layout**:
    - `Column` with `CrossAxisAlignment.center` (Text/Icons centered relative to each other).
- **Interaction**:
    - **Tap**: Navigates to `FeedsPage`.

#### [NEW] [settings_page.dart](file:///Users/C5404787/workplace/personal/return_zero/lib/features/settings/presentation/pages/settings_page.dart)
- Preference storage
- Navigation

**Commit 27**: Add launcher settings
- Set as default launcher option
- Wallpaper & quote preferences (if implemented)
- Theme preferences (OLED black vs dark gray)
- Widget management for My Feeds (remove, reorder)
- Reset options

**Commit 28**: Polish UI/UX
- Smooth fade animations
- Loading states (minimal spinners or text)
- Error states (simple text messages)
- Empty states ("No apps found")
- Keyboard auto-show/hide smoothness

---

### Phase 8: Documentation & CI/CD

#### [MODIFY] README.md
**Commit 29**: Update documentation
- Feature list (smart search, My Feeds, wallpapers with quotes)
- Design philosophy (minimalist, icon-less, distraction-free)
- Screenshots
- Setup instructions
- Permissions explanation

#### [NEW] GitHub Actions
**Commit 30**: Add CI/CD for release/alpha
- Build APK on push to release/alpha branch
- Generate release artifacts
- Auto-versioning

---

## Design Reference

![User's Design Reference](/Users/C5404787/.gemini/antigravity/brain/dd8a10e6-d6b1-415d-9c54-301ec4877f9c/uploaded_image_1765648612701.jpg)

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
