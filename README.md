# Union Shop - UoP Students' Union E-commerce App

A professional Flutter mobile e-commerce application for the University of Portsmouth Students' Union Shop. This app allows students to browse, purchase, and manage orders for exclusive UoP branded merchandise including hoodies, t-shirts, gifts, and graduation items.

## Key Features

- 🛍️ **Product Browsing** - Browse products across multiple collections (Hoodies & Sweatshirts, T-Shirts, Gifts, Graduation, Essentials, Summer Favourites)
- 🏷️ **Sales & Discounts** - View and filter sale items with discounted prices clearly marked
- 🛒 **Shopping Cart** - Add/remove items, adjust quantities, automatic discount calculation
- 🔍 **Smart Search** - Search products by name or category
- 👤 **User Authentication** - Create account and manage profile
- 📦 **Responsive Design** - Optimized for mobile and desktop viewing (768px breakpoint)
- 📧 **Contact Support** - Easy access to business contact information and social media
- 🎨 **Professional UI** - Modern Material Design with UoP brand colors

## Installation and Setup Instructions

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.0 or later)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **Xcode** (for mobile emulation)
- **Git** (for cloning the repository)

### Clone the Repository

```bash
git clone https://github.com/Johnahmad341/union_shop.git
cd union_shop
```

### Installation Guide

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Run Flutter Doctor** (verify setup)
   ```bash
   flutter doctor
   ```

3. **Set Up Emulator or Connect Device**
   - For Android: Open Android Studio and create/start an emulator
   - For iOS: `open ios/Runner.xcworkspace` and run from Xcode
   - Or connect a physical device via USB

### Running the Project

**Development Mode:**
```bash
flutter run
```

**Release Mode:**
```bash
flutter run --release
```

**Run on Specific Device:**
```bash
flutter run -d <device_id>
```

## Usage Instructions

### Main Features

1. **Browsing Products**
   - Tap on a collection to view products
   - View product details, images, prices, and descriptions
   - Sale items display original price (crossed out) and sale price in red

2. **Shopping Cart**
   - Tap the shopping bag icon in the app bar to access cart
   - Add items with size/color options
   - Adjust quantities using +/- buttons
   - Sale prices automatically apply to cart totals
   - Proceed to checkout

3. **Searching Products**
   - Tap the search icon in the app bar
   - Enter product name or category
   - Results display matching products

4. **Sales and Filters**
   - Access Sale Collection via the menu
   - Sort by: Featured, Price (Low-High, High-Low), Discount (High-Low)
   - Filter by: All Products, In Stock Only

5. **Account Management**
   - Tap the account icon to login/register
   - View order history
   - Update profile information

6. **Contact & Support**
   - Scroll to footer and tap "Contact Us"
   - View business contact information
   - Access location, phone, email, hours, transport info
   - Connect via social media

### Running Tests

**Run All Tests:**
```bash
flutter test
```

**Run Tests with Coverage:**
```bash
flutter test --coverage
```

**Run Specific Test File:**
```bash
flutter test test/widgets/app_bar_test.dart
```

**Run Tests Matching Pattern:**
```bash
flutter test --name "ProductRepository"
```

### Test Files

- `test/repositories/product_repository_test.dart` - Product data and queries (9 tests)
- `test/services/cart_service_test.dart` - Shopping cart operations (12 tests)
- `test/models/product_model_test.dart` - Product model validation (10 tests)
- `test/models/cart_item_model_test.dart` - Cart item behavior (9 tests)
- `test/widgets/product_card_test.dart` - Product card display (9 tests)
- `test/widgets/footer_test.dart` - Footer navigation (10 tests)
- `test/widgets/app_bar_test.dart` - App bar functionality (14 tests)

**Total: 73 passing tests**

## Project Structure and Technologies

### Folder Organization

```
lib/
├── main.dart                 # App entry point and routing configuration
├── src/
│   ├── models/              # Data models (Product, CartItem, etc.)
│   ├── repositories/        # Data access layer (ProductRepository)
│   ├── services/            # Business logic (CartService)
│   ├── pages/               # Full-screen views
│   └── widgets/             # Reusable UI components
├── assets/
│   └── images/              # Product images organized by category
└── test/                    # Unit and widget tests

test/
├── repositories/            # Repository tests
├── services/               # Service tests
├── models/                 # Model tests
└── widgets/                # Widget tests
```

### Key Technologies & Dependencies

- **Flutter** - UI framework
- **Provider** - State management
- **Font Awesome Flutter** - Social media icons
- **Dart** - Programming language

### Key Packages

```yaml
flutter:
  sdk: flutter
provider: ^6.0.0
font_awesome_flutter: ^10.0.0
flutter_test:
  sdk: flutter
```

### Development Tools

- **Analysis Options** - Code quality and linting rules (analysis_options.yaml)
- **Dart Format** - Code formatting consistency
- **Flutter Analyzer** - Static code analysis

## Limitations and Future Improvements

### Current Limitations

- 🌐 **Offline Mode** - App requires internet connection for product images and data
- 💳 **Payment Integration** - Checkout process is UI-only (backend integration needed)
- 🗺️ **Map Integration** - Map placeholder on contact page (requires Google Maps API setup)
- 📱 **Platform Support** - Currently configured for Android and iOS (not web/desktop)

### Future Improvements

- [ ] Implement complete payment processing system
- [ ] Add order tracking and notifications
- [ ] Integrate Google Maps API for location display
- [ ] Add product review and rating system
- [ ] Implement user wishlist functionality
- [ ] Add push notifications for sales/promotions
- [ ] Dark mode support
- [ ] Multiple language support
- [ ] Integration with real backend API

## Contact Information

**Developer:** John Ahmad
**Email:** up2268027@myport.ac.uk
**GitHub:** [https://github.com/Johnahmad341](https://github.com/Johnahmad341)
**University:** University of Portsmouth

### Other Projects

- [Check out my other projects on GitHub](https://github.com/Johnahmad341)

---

**Last Updated:** December 2025
**Flutter Version:** 3.0+
**Forked From:** [Mani Gharemani](https://github.com/manighahrmani)
