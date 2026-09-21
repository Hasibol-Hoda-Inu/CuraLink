# 🩺 CuraLink

**CuraLink** is a modern, comprehensive healthcare and telemedicine application built with Flutter. It bridges the gap between patients and healthcare providers by offering seamless doctor appointment bookings, pharmacy deliveries, health tracking, and curated medical articles all in one unified platform.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Material 3](https://img.shields.io/badge/Material%203-F3E5F5?style=for-the-badge&logo=materialdesign&logoColor=673AB7)

---

## ✨ Key Features

*   **👨‍⚕️ Find & Book Top Doctors:** Browse specialists, view detailed doctor profiles (experience, patient reviews, location), and book specific time/date slots.
*   **🏥 Flexible Consultation Types:** Choose between "In-Clinic Visits" or virtual "Video Consults".
*   **💊 Online Pharmacy:** Browse medical products, view discounts, and upload prescriptions for seamless medicine delivery.
*   **📰 Health Articles:** Stay updated with the latest health and wellness tips curated by professionals.
*   **👤 Patient Profile Dashboard:** Track vital health statistics like Heart Rate, Calories, and Weight directly from the profile screen.
*   **📱 Responsive UI:** Pixel-perfect design that scales beautifully across all device sizes using dynamic screen utilities.

---

## 🏗️ Architecture: Feature-First (Clean Architecture)

CuraLink is built using a **Feature-Driven (Feature-First) Folder Structure**. Instead of grouping files by their technical type (e.g., placing all screens in one folder and all widgets in another), the codebase is strictly separated by **business features**.

This approach ensures modularity, high scalability, and makes it incredibly easy for teams to collaborate without causing merge conflicts.

---

## 🛠️ Tech Stack & Tools

* **Framework:** Flutter (SDK ^3.47.4)
* **Routing:** `go_router` - Declarative, URL-based routing for robust navigation and deep-linking capabilities.
* **Responsive UI:** `flutter_screenutil` - Ensures the UI matches design specifications exactly by adapting `.w` (width), `.h` (height), and `.sp` (scalable text) to the user's specific screen size.
* **Vector Graphics:** `flutter_svg` - Crisp, scalable, and lightweight SVG icon rendering.
* **Design System:** Material 3 UI constraints utilizing the Poppins typography family.

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (^3.47.4 or higher)
* Dart SDK
* Android Studio / VS Code