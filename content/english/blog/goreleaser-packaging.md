---
title: "What I have learned while creating Linux packages using Goreleaser for terramate"
date: 2024-05-03T16:18:50+02:00
draft: false
author: "René Kuhn"
image: "/images/goreleaser/goreleaser.webp"

---



[Goreleaser]() is a great tool to automatically build, package and release your go application. It also has great support for pushing your `.deb` and `.rpm` packages to [fury.io](fury.io). In this guide we will be using the pro version of goreleaser. However there are ways around the pro version if you want to publish linux packages and have them hosted for free at fury.io. 

In order to automate the whole process you can use the official go releaser github action and create a `.goreleaser.yaml` configuration file in the root of your repository. 


Let's have a look at an example `.goreleaser.yaml` and go through it 

```yaml
project_name: sunset-berlin

before:
  hooks:
    - go mod tidy

builds:
  - id: sunset-berlin
    main: ./
    env:
      - CGO_ENABLED=0
    goos:
      - darwin
      - linux
      - windows
    goarch:
      - amd64
      - arm64
    ldflags:
      - "-s"
      - "-w"
      - "-X main.version={{ .Version }}"
      - "-X main.osArch={{ .Os }}/{{ .Arch }}"

archives:
  - id: sunset-berlin
    name_template: "{{ .ProjectName }}_{{ .Os }}_{{ .Arch }}_{{ .Version }}"
    format_overrides:
      - goos: windows
        format: zip
      - goos: darwin
        format: tar.gz
      - goos: linux
        format: tar.gz
    files:
      - "{{ .Os }}-{{ .Arch }}/{{ .ProjectName }}*"
```

In the YAML snippet above, we configured Goreleaser for the "sunset-berlin" project with the following settings:

- **Pre-Build Hook**: Executes `go mod tidy` to clean up the Go modules.
- **Build Configurations**: Targets multiple operating systems (Darwin, Linux, Windows) and architectures (AMD64, ARM64), with CGO disabled to ensure static binaries. It also incorporates version and system architecture directly into the executable through linker flags.
- **Archives**: Sets up ZIP files for Windows and tar.gz for Darwin and Linux, with a unique naming convention that includes the project name, operating system, architecture, and version.
- **Files Included**: Defines the patterns to include only the necessary binaries in each archive.

That's a great start, now our users are already able to download the precompiled binaries manually from the GitHub Releases Page. And use our `sunset-berlin` program.

However this is not the most convenient solution for them as they have to navigate to the download directory to execute the binary.

Let's improve this for our Linux users by packaging `.deb` and `.rpm` repos that they can install in their path.


```yaml

nfpms:
  - maintainer: RehJunior
    description: shows when the sun goes down in Berlin
    homepage: https://github.com/RehJunior/sunset-berlin/
    license: MIT
    formats:
      - deb
      - rpm

```
Just by adding this block to our `.goreleaser.yaml` Goreleaser will create valid Linux packages and also store them in the release artifacts where users can download them and install them using their native package manager.


The last step is to configure the fury.io integration. Add this block to the `.goreleaser.yaml` configuration.

```yaml
furies:
 - # fury.io account.
    # Config is skipped if empty
    account: cyberants
    secret_name: FURY_TOKEN
    formats:
      - deb
      - rpm
```

Make sure to create a free account on fury.io and save the push token as repository secret using `FURY_TOKEN` as the key.


