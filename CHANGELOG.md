# htpasswd Cookbook Changelog

This file is used to list changes made in each version of the htpasswd cookbook.

## Unreleased

## 2.0.17 - *2025-09-04*

## 2.0.16 - *2024-12-05*

## 2.0.15 - *2024-05-01*

## 2.0.14 - *2024-05-01*

## 2.0.13 - *2023-12-21*

## 2.0.12 - *2023-09-28*

## 2.0.11 - *2023-09-04*

## 2.0.10 - *2023-07-10*

## 2.0.9 - *2023-05-17*

## 2.0.8 - *2023-05-03*

## 2.0.7 - *2023-04-01*

## 2.0.6 - *2023-03-02*

- Standardise files with files in sous-chefs/repo-management

## 2.0.5 - *2023-02-14*

- Remove delivery folder

## 2.0.4 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 2.0.3 - *2021-06-08*

- Fix helper script to use file instead of name property

## 2.0.2 - *2021-06-08*

- [CI] Update ActionsHub actions to point at main
- [CI] Update GitHub Actions checkout to v2

## 2.0.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 2.0.0 - *2021-05-13*

- Chef 17 updates: enable `unified_mode` on all resources
- Bump required Chef Infra Client to >= 15.3

## 1.0.0 - 2020-09-28

### Fixed

- Automated PR: Cookstyle Changes [\#39](https://github.com/sous-chefs/htpasswd/pull/39)
- Automated PR: Standardising Files [\#38](https://github.com/sous-chefs/htpasswd/pull/38)
- Fix converge failures on Chef 16
- Fix idempotency for `:add` and `:delete` actions
- Fix htauth gem loading issues

### Added

- Support for 'plaintext' type [\#32](https://github.com/sous-chefs/htpasswd/pull/32)
- Adoption by Sous-Chefs [\#40](https://github.com/sous-chefs/htpasswd/pull/40)
- Add delete and overwrite test-kitchen suites
- Add mode parameters for file

### Changed

- Update test-kitchen to modern platforms
- Update metadata.rb for Sous Chefs
- Update README.md for Sous Chefs
- Convert htpasswd to a custom resource

### Removed

- Remove unused recipes and other dependencies

## 0.3.0 - 2017-05-21

- Tests [\#30](https://github.com/sous-chefs/htpasswd/pull/30)
- Fix FC069, FC071, FC078 [\#26](https://github.com/sous-chefs/htpasswd/pull/26)
- Update testing [\#25](https://github.com/sous-chefs/htpasswd/pull/25)
- Switch from python to poise-python [\#24](https://github.com/sous-chefs/htpasswd/pull/24)
- Update attribute default.rb  [\#22](https://github.com/sous-chefs/htpasswd/pull/22)
- Drop ruby 1.9.3 [\#20](https://github.com/sous-chefs/htpasswd/pull/20)
- Add default package to packages attribute [\#19](https://github.com/sous-chefs/htpasswd/pull/19)
- Fix Jenkins URL to match github repo [\#18](https://github.com/sous-chefs/htpasswd/pull/18)

## 0.2.4 - 2014-09-23

- Remove ruby dep (very old and unmaintained) (fixed #15)
- Fix rubocop
- Update rubocop

## 0.2.2 - 2014-09-17

- Cleanup provider init
- Add why-run

## 0.2.0 - 2014-09-17

- Add matchers for chefspec [\#14](https://github.com/sous-chefs/htpasswd/pull/14)
- Added a new resource type so the hashing algorithm can be changed [\#13](https://github.com/sous-chefs/htpasswd/pull/13)

## 0.1.2 - 2014-03-14

- Rubocop [\#12](https://github.com/sous-chefs/htpasswd/pull/12)
- Fix travis [\#11](https://github.com/sous-chefs/htpasswd/pull/11)
- Use htauth lib to manage htpasswd files. [\#10](https://github.com/sous-chefs/htpasswd/pull/10)
- Added :delete action for user [\#5](https://github.com/sous-chefs/htpasswd/pull/5)

## 0.0.3 - 2013-07-18

- Berkshelf support

## 0.0.2 - 2013-07-18

- Initial release
