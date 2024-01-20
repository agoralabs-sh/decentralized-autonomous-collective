<p align="center">
  <a href="https://agoralabs.sh">
    <img alt="Agora labs logo" src="assets/agora_labs_logo-64x64.png" style="padding-top: 15px" height="64" />
  </a>
</p>

<h1 align="center">
  Decentralized Autonomous Collective
</h1>

<p align="center">
  <a href="https://github.com/agoralabs-sh/decentralized-autonomous-collective/releases/latest">
    <img alt="GitHub release" src="https://img.shields.io/github/v/release/agoralabs-sh/decentralized-autonomous-collective?&logo=github">
  </a>
  <a href="https://github.com/agoralabs-sh/decentralized-autonomous-collective/releases/latest">
    <img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/agoralabs-sh/decentralized-autonomous-collective?logo=github">
  </a>
</p>

<p align="center">
  <a href="https://github.com/agoralabs-sh/decentralized-autonomous-collective/releases">
    <img alt="GitHub License" src="https://img.shields.io/github/v/release/agoralabs-sh/decentralized-autonomous-collective?include_prereleases&label=pre-release&logo=github">
  </a>
  <a href="https://github.com/agoralabs-sh/decentralized-autonomous-collective/releases">
    <img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date-pre/agoralabs-sh/decentralized-autonomous-collective?label=pre-release date&logo=github">
  </a>
</p>

<p align="center">
  <a href="https://github.com/agoralabs-sh/decentralized-autonomous-collective/blob/main/LICENSE">
    <img alt="GitHub License" src="https://img.shields.io/github/license/agoralabs-sh/decentralized-autonomous-collective">
  </a>
</p>

<p align="center">
  This repo provides the tools, docs and smart contracts to manage the Decentralized Autonomous Collective (DAC) that underpins the structure and inner workings of Agora Labs.
</p>

### Table of contents

* [1. Usage](#-1-usage)
* [2. Development](#-2-development)
  - [2.1. Overview](#21-overview)
  - [2.2. Requirements](#22-requirements)
  - [2.3. Setup](#23-setup)
  - [2.4. Build](#24-build)
  - [2.5. Run](#25-run)
* [3. Appendix](#-3-appendix)
  - [3.1. Useful Scripts](#31-useful-scripts)
* [4. How to Contribute](#-4-how-to-contribute)
* [5. License](#-5-license)

<sup>[Back to top ^][table-of-contents]</sup>

## 🪄 1. Usage

Please refer to the [documentation][documentation] on how to manage the DAC.

<sup>[Back to top ^][table-of-contents]</sup>

## 🛠 2. Development

### 2.1. Overview

Below is a quick outline of the structure of the app:

```text
.
├── cmd                        # Go apps.
|   ├── stinger
|   │   └── main.go            # Entry point for the app.
│   └── ...
└── internal                   # A collection of reusable modules.
    ├── command                # A collection of commands.
    |   └── somecommand.go
    |   └── ...
    └── ...
```

### 2.2. Requirements

* [Docker][docker]
* [Docker Compose v2.5.0+][docker-compose]
* [Go 1.21+][golang]
* [Python v3.10+][python]
* [pip][pip] (optional, but highly recommended)
* [PyTeal][pyteal]

<sup>[Back to top ^][table-of-contents]</sup>

### 2.3. Setup

1. The easiest way to install PyTeal is using `pip`
```shell
pip3 pyteal
```

2. Install Go dependencies:
```shell
go mod tidy
```

3. Install Algorand private network (optional):
```shell
./bin/install_algorand.sh
```

<sup>[Back to top ^][table-of-contents]</sup>

### 2.4. Build

* To build simply run:
```bash
./bin/build.sh
```

> **NOTE:** This will compile the source code into a binary and move smart contracts to  the `.build/` directory.

### 2.5. Run

1. To check the CLI compiled correctly:
```bash
./build/dac version
```

<sup>[Back to top ^][table-of-contents]</sup>

## 📑 3. Appendix

### 3.1. Useful Scripts

| Command                     | Description                                                       |
|-----------------------------|-------------------------------------------------------------------|
| `./bin/build.sh`            | Builds the CLI tool and contracts into the `.build/` directory.   |
| `./bin/install_algorand.sh` | Installs a private Algorand network.                              |
| `./bin/package.sh`          | Zips up the build files into a zip file.                          |
| `./bin/start_algorand.sh`   | Starts up the private Algorand network                            |
| `./bin/test.sh`             | Starts up the Algorand private network and runs tests against it. |
| `./bin/version.sh`          | Sets the version in the [VERSION][version] file.                  |

## 👏 4. How to Contribute

Please read the [**Contributing Guide**][contribute] to learn about the development process.

<sup>[Back to top ^][table-of-contents]</sup>

## 📄 5. License

Please refer to the [LICENSE][license] file.

<sup>[Back to top ^][table-of-contents]</sup>

<!-- Links -->
[contribute]: ./CONTRIBUTING.md
[docker]: https://docs.docker.com/get-docker/
[docker-compose]: https://docs.docker.com/compose/install/
[documentation]: https://dac.agoralabs.sh
[golang]: https://golang.org/dl/
[license]: ./LICENSE
[pip]: https://pip.pypa.io/en/stable/installation/
[pyteal]: https://pyteal.readthedocs.io/en/latest/installation.html
[python]: https://www.python.org/downloads/
[table-of-contents]: #table-of-contents
[version]: ./VERSION

