# The MovieDB App
> **:movie_camera: Simple movies app made with Swift 5.1.**
___

![Swift Version](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat-square)
![License](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)
![Travis](https://img.shields.io/travis/alexandrehcdc/the-moviedb-app?style=flat-square)

## Features and usage
This application is made based on the **[The Movie DB](https://www.themoviedb.org/)** API, which shows the latest upcoming movies.
**Features**:
- Search by movie title;
- Movie details;
- Dark and Light mode;
- Location pick (you can see upcoming movies from other regions around the world!);
- Available in Portuguese-BR and English-US.

## Installation and requirements
You will need **[CocoaPods](https://cocoapods.org/)** and **[Xcode](https://developer.apple.com/xcode/)** installed on your machine to retrieve and build the dependencies used on this project, with these simple steps:

```bash
git clone https://github.com/alexandrehcdc/the-moviedb-app.git
cd the-moviedb-app
pod install
open Code the-moviedb-app.xcworkspace/
```
##### :warning: Warning :warning:
**Due to the nature of the iOS development proccess through Xcode, an additional step of switching the developer certificate found on the project general settings is required to build/run the project.**

## Architecture
The project is mainly inspired by MVP. 
- Views and environments related are segmented in Screen folders together with their respective structure (such as Presenters and Extensions);
- Model folder contains most entities related to the business rule, with Responses (Codable compliant structs), Entities, DTOs (Data Transfer Object) and Converters for mapping between model layers;
- Common folder contains general purpose files/components to the app, such as:
  - Protocols;
  - Use cases;
  - Enums;
  - Network utils;
  - Application locale;
  - Multi-purpose extensions;
  - UIView components (planned to use, but due to the application short scope, only one CollectionViewCell component was created.);

## Tools and libraries used
* **[OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)**: Stubs provider for network behavior manipulation through tests
* **[Travis-CI](https://travis-ci.org/)**: Continuous Integration service.
* **[Fakery](https://github.com/vadymmarkov/Fakery)**: A library for generating fake data on tests.