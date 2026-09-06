This is the subset of Qt on which Dolphin relies for development and
distribution tasks.

Note that this subset only supports building and deploying Dolphin. If you want
the full Qt development toolset, you will need to install them separately.

## Usage

To download, configure, and build a Qt subset, run the following command:

```bash
cmake --workflow qt-x64
```

Do the same for ARM64 if needed, by replacing `x64` with `arm64` in the command above.

## Changing Qt version

To change the Qt version, edit the `CMakeLists.txt` file and modify the `GIT_TAG` from which the Qt meta-repo is cloned, taking care to disable any submodules and features that are not needed for building Dolphin.
