# Limitations

## Package Availability

This cookbook manages Apache htpasswd-format files through the Ruby `htauth` gem. It does not install Apache HTTP Server packages or call the platform `htpasswd` binary.

### APT (Debian/Ubuntu)

No APT package is required by the cookbook resource. Supported test platforms are Debian 12, Ubuntu 22.04, and Ubuntu 24.04.

### DNF/YUM (RHEL family)

No DNF/YUM package is required by the cookbook resource. Supported test platforms are AlmaLinux 8/9, Amazon Linux 2023, CentOS Stream 9, Fedora latest, Oracle Linux 8/9, Rocky Linux 8/9, and Red Hat Enterprise Linux 8/9.

### Zypper (SUSE)

No Zypper package is required by the cookbook resource. openSUSE Leap is not included in the current test matrix because Leap 15.6 reaches end of life on 2026-04-30 and Leap 16 support has not been validated in this migration.

## Architecture Limitations

The resource uses Ruby file operations and the `htauth` gem, so there are no known cookbook-specific architecture restrictions.

## Source/Compiled Installation

The cookbook does not build htpasswd itself. The `htauth` gem is installed by Chef's `chef_gem` resource before htpasswd files are managed. Because `htauth` depends on native gems such as `bcrypt`, the resource installs platform build tools through Chef's `build_essential` resource before installing the gem.

## Known Issues

* This resource manages flat htpasswd files only. It does not manage DBM password databases.
* The `:overwrite` action rewrites the target file and is not idempotent.
* Platform support is aligned to non-EOL operating system releases as of 2026-05-07.
