# nichol_ui_lib_list_handler

A Flutter UI package providing a **Riverpod-enabled list system** with reusable list items, modal actions, and customizable icon-driven list controls.

This library is designed for building interactive list UIs where each item can trigger edit/delete modals and respond to state changes cleanly using `ConsumerWidget`.

---

# Features

* Riverpod-ready `ConsumerWidget` list items
* Reusable `ListView` handler widget
* Built-in modal integration for edit/delete actions
* Custom leading and trailing icon support
* Clean separation between list handler and list item UI
* Supports dynamic selection highlighting

---

# Installation

Add to your `pubspec.yaml` (local package):

```yaml
dependencies:
  nichol_ui_lib_list_handler:
    path: ../nichol_ui_lib_list_handler
```

Then run:

```bash
flutter pub get
```

---

# Imports

```dart
import 'package:nichol_ui_lib_list_handler/nichol_ui_lib_list_handler.dart';
```

This exports:

* `NicholUILibListHandler`
* `NicholUILibListItem`

---

# Architecture Overview

This package is split into two core components:

## 1. List Handler

Responsible for rendering a scrollable list.

```dart
class NicholUILibListHandler extends StatelessWidget {
  final List<NicholUILibListItem> listItems;
  final int selectedListItem;
}
```

Uses `ListView.builder` to render each item.

---

## 2. List Item

A `ConsumerWidget` representing each row in the list.

Each item supports:

* Title display
* Selection state
* Tap handling
* Edit modal trigger
* Delete modal trigger
* Custom icon injection (leading/trailing)

```dart
class NicholUILibListItem extends ConsumerWidget {
  final String title;
  final int iteration;
  final bool isSelected;
  final VoidCallback onTap;
}
```

---

# Features in Detail

## ✏️ Edit Support

If `editOption` is provided, an edit icon is automatically added.

Triggers a modal:

* Uses `NicholUILibTemplateModalPage`
* Sends updated value via `onSubmit`

---

## 🗑 Delete Support

If `deleteOption` is provided, a delete icon is automatically added.

Triggers a confirmation modal:

* Requires user confirmation via button press

---

## 🎨 Custom Icons

You can inject custom UI controls:

```dart
leadingIconsList: [...],
trailingIconsList: [...],
```

These are wrapped using `Wrap` for spacing consistency.

---

## 📦 Selection State

Items support visual selection:

```dart
tileColor: isSelected ? Colors.blueGrey : null
```

---

# Usage Example

## Basic List

```dart
NicholUILibListHandler
(
  listItems: [
    NicholUILibListItem(
      title: "Item 1",
      iteration: 0,
      onTap: () {},
    ),
    NicholUILibListItem(
      title: "Item 2",
      iteration: 1,
      onTap: () {},
    ),
  ],
  selectedListItem: 0,
)
```

---

## With Edit/Delete Actions

```dart
NicholUILibListItem(
  title: "Editable Item",
  iteration: 0,
  onTap: () {},
  editOption: (value) {
    print("Edited: $value");
  },
  deleteOption: () {
    print("Deleted item");
  },
)
```

---

## With Custom Icons

```dart
NicholUILibListItem(
  title: "Custom Item",
  iteration: 0,
  onTap: () {},
  leadingIconsList: [
    IconButton(icon: Icon(Icons.star), onPressed: () {}),
  ],
  trailingIconsList: [
    IconButton(icon: Icon(Icons.info), onPressed: () {}),
  ],
)
```

---

# Modal Integration

This package depends on:

* `nichol_ui_lib_modals_and_button_triggers`

Used for:

* Edit dialogs
* Delete confirmation dialogs
* Input capture via `TemplateModalPage`

---

# Riverpod Usage

All list items extend `ConsumerWidget`, allowing future expansion for:

* State-driven selection
* Provider-based list updates
* Reactive UI rebuilding

Even if not currently required in every item, Riverpod is available via:

```dart
Widget build(BuildContext context, WidgetRef ref)
```

---

# Important Notes

* `listItems` must be a list of **widgets**, not raw data models
* Each item is responsible for its own UI and modal behavior
* This design prioritizes flexibility over strict separation of data/model layers

---

# Potential Improvements

* Convert list items to data models + provider-driven builder
* Add animated selection transitions
* Add slidable actions (swipe gestures)
* Introduce list diffing for performance
* Add Riverpod provider wrappers for list state

---

# License

Add a license file before publishing.
