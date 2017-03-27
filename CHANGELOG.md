# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- A custom reporter so you can customize the test output.
- Given, When, Then test blocks.

### Changed


## [0.2.0] - 2017-01-14
### Added
- The following sections to README:
	* Requirements
	* How To Use
	* Matchers
	* Features
	* Contributing
- An `ISSUE_TEMPLATE.md` file to have a template for for bugs, enhancements or optimizations, and new features.
- An MIT `LICENSE` document.
- A Contributing file with the following sections:
	* What should I know before I get started?
	* How Can I Contribute?
	* Styleguides
	* Code of Conduct

### Changed


## [0.1.0] - 2016-12-21
### Added
- An `ObserveTestable` protocol that defines methods and properties that help execute test closures, and an `ObserveTest` object that confroms to that protocol.
- A describe function that can be embeded inside other describe methods, to make tests more readable.
- A context and it function that call the describe function.
- A before each method that makes it easy to run a peice of code before each describe function within the same scope.

### Changed


