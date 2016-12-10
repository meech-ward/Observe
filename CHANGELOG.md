# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- An `ObserveTestable` protocol that defines methods and properties that help execute test closures, and an `ObserveTest` object that confroms to that protocol.
- A describe function that can be embeded inside other describe methods, to make tests more readable.
- A before each method that makes it easy to run a peice of code before each describe function within the same scope.

### Changed


