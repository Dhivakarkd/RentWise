# RentWise

**RentWise** is a rental management application built with Flutter. It helps landlords and property managers keep track of tenant details, manage electricity readings, and generate monthly rent invoices. This application is designed to simplify the process of managing rental properties, ensuring everything from tenant information to billing is easily accessible and well-organized.

## Features

- **Tenant Management**: Store and manage details of tenants, including their name, floor, house, electricity bill rate, deposit amount, and house rent amount.
- **Electricity Readings**: Record monthly electricity readings for each tenant and store them for rent calculations.
- **Rent Calculation**: Automatically calculate the monthly rent, including the electricity bill, based on the tenant's electricity usage.
- **Dashboard**: View all tenant details in a centralized dashboard, with easy access to detailed tenant information by simply clicking on their name.

## Project Structure

The project follows a modular folder structure to maintain a clean and organized codebase:

```plaintext
RentWise/
│
├── android/                 # Android-specific files
├── ios/                     # iOS-specific files
├── lib/
│   ├── data/
│   │   ├── models/
│   │   │   ├── tenant.dart              # Tenant data model
│   │   │   └── electricity_reading.dart # ElectricityReading data model
│   │   ├── database/
│   │   │   └── database_helper.dart     # Database helper class
│   ├── screens/
│   │   ├── dashboard_screen.dart        # Main dashboard screen
│   │   ├── tenant_details_screen.dart   # Screen showing tenant details
│   │   └── add_edit_tenant_screen.dart  # Screen for adding/editing tenants
│   ├── widgets/
│   │   ├── tenant_card.dart             # Custom widget to display tenant info in a card format
│   │   └── custom_button.dart           # Custom button widget (if any)
│   ├── utils/
│   │   └── constants.dart               # Any constants like colors, text styles, etc.
│   ├── main.dart                        # Main entry point of the application
│
├── assets/
│   ├── images/                          # Folder for image assets
│   └── fonts/                           # Folder for custom fonts
│
├── test/                                # Unit tests
├── pubspec.yaml                         # Pubspec file for managing dependencies
└── README.md                            # Project README file

```

## Folder Structure

### lib
Contains core application logic and components.

* **data:**
  * **models:** Data models for tenants and electricity readings.
  * **database:** SQLite database helper for CRUD operations.
* **screens:**
  * **dashboard_screen.dart:** Displays a list of tenants.
  * **tenant_details_screen.dart:** Shows detailed tenant information.
  * **add_edit_tenant_screen.dart:** Allows adding or editing tenant information.
* **widgets:**
  * **tenant_card.dart:** A reusable widget to display tenant information in a card format.
  * **custom_button.dart:** Custom buttons used throughout the app.
* **utils:**
  * **constants.dart:** Stores app-wide constants like colors, text styles, etc.

### assets
Stores images, fonts, and other static assets.

### test
Contains unit tests for the application.
