# Don't Starve Together Dedicated Server

Ultra-lightweight containerized dedicated server for Don't Starve Together.

This project aims to build the most efficient, most reliable, and smallest possible DST dedicated server containers. The build process completely decouples the Steam client and dependency management from the server containers. It leverages read-only Docker volumes containing the server files and required libraries to enable running DST in a "FROM scratch" container.

## Getting Started

Using this project is as simple as downloading the script and running it. A few very straightforward dependencies are listed below, along with a copy-and-paste command to pull the script down.

### Prerequisites

A few basic requirements are all that's needed:

 - Docker Engine CE
 - Docker Compose

This was tested on Amazon Linux 2.

### Installation

Simply clone the repository and make the setup script executable:

```
git clone https://github.com/tfrederick74656/dst-dedicated-server.git && \
cd dst-dedicated-server/ && \
chmod +x ./setup-game.sh
```

## Usage

The setup-game script first runs the `steam`, `lib`, and `setup` containers:
 - The `steam` container runs steamcmd and downloads the DST application files to a Docker volume.
 - The `lib` container runs apt-get in a Debian container to pull down the required libraries and then copies them out to a Docker volume.
 - The `setup` container creates the required DST Cluster configuration files/directories from a template.
After the setup process is completed, the script will launch the `master` and `caves` containers, which run the respective DST shards.

## Contributing

Questions, comments, and pull requests are welcome. Please note however, as this is a side project, there may be a significant delay in my response.

## Versioning

I use [SemVer](https://semver.org/) for versioning. For a complete version history, see the [tags on this repository](https://github.com/tfrederick74656/dst-dedicated-server/tags).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
