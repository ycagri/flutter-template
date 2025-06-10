# Flutter Template

## Automated Versioning with Conventional Commits and Semantic Release
This repository utilizes [Semantic versioning](https://semver.org/) and [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) to automate version management through continuous integration. This ensures a clear, predictable versioning scheme and streamlines our release process.

### Semantic Versioning (MAJOR.MINOR.PATCH)
Version numbers follow the `MAJOR.MINOR.PATCH` format, incremented based on the following changes:
1. **MAJOR version:** Incremented for **incompatible changes**. This signifies that application dropped support for certain type of devices.
2. **MINOR version:** Incremented when **new functionality is added in a backward-compatible manner**.
3. **PATCH version:** Incremented for **backward-compatible bug fixes**.

### Conventional Commits
This lightweight convention provides a structured commit history, which is essential for automated versioning tools. Each commit message must start with a specific type prefix, followed by a colon and a space, then a concise description.

Examples of common commit types:

- `feat`: A new feature (e.g., `feat: add user profile page`).
- `fix`: A bug fix (e.g., `fix: resolve login redirect issue`).
- `chore`: Routine tasks, refactoring, or maintenance that don't add new features or fix bugs (e.g., `chore: update dependencies`).
- `docs`: Documentation changes (e.g., `docs: update README with new instructions`).
- `test`: Adding or refactoring tests (e.g., `test: add unit tests for data validation`).
- `build`: Changes that affect the build system or external dependencies (e.g., `build: update webpack configuration`).

### Automated Versioning with Semantic Release
Versioning is handled by Semantic Release tools, configured in the [ci_version.yaml](.github/workflows/ci_version.yaml) workflow. When a commit is pushed to the `develop` branch, Semantic Release analyzes the commit messages to determine the next application version based on these rules:

- **MAJOR Version Increment:** A `MAJOR` version increment is triggered by any commit message containing a `BREAKING CHANGE:` footer.
```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```
- **MINOR Version Increment:** Any commit prefixed with `feat:` will increment the `MINOR` version.
```
feat: send an email to the customer when a product is shipped
```
- **PATCH Version Increment:** Any commit prefixed with `fix:` will increment the `PATCH` version.
```
fix: prevent racing of requests
```
- **No Version Change:** Other commit types, such as `docs:`, `build:`, or `chore:`, do not affect the application version.

The semantic release pipeline has just **one prerequisite**: **initial tag** of the repository has to be **manually created**.
```bash
git tag -a v.0.0.0 -m "Initial Tag"
git push origin v0.0.0
```

## Google Play Continuous Deployment

In order to use [cd_android.yaml](.github/workflows/cd_android.yaml), there are two main steps to complete.
### Create Service Account
1. Create a project at [Google Cloud Console](https://console.cloud.google.com/)
2. Go to `Service Accounts`
3. Create a service account
4. Add a key to the service account
5. Download the key as json
6. Run the command to base64 encode `base64 -i <SERVICE_ACCOUNT.json>`
7. Save the output as `SERVICE_ACCOUNT_JSON` repository secret
### Create a Keystore
1. Open `android` directory in Android Studio
2. Wait for the gradle sync
3. Go to `Build->Generate Signed Apk or Bundle`
4. Select `Android App Bundle`
5. Create new keystore and provide key alias, keystore password and key alias password. Do not forget to save key alias, keystore password and key alias password.
6. Save the keystore to `android/keystore` directory as `release-keystore.jks`
7. Set repository secrets: `KEY_ALIAS` as key alias, `KEY_ALIAS_PASSWORD` as key alias password, `KEYSTORE_PASSWORD` as key store password.

## Apple Store Continuous Deployment

In order to use [cd_ios.yaml](.github/workflows/cd_ios.yaml), below repository secrets have to be created:
- `BUILD_CERTIFICATE_BASE64`
- `BUILD_CERTIFICATE_PASSWORD`
- `BUILD_PROVISIONING_PROFILE_BASE64`
- `KEYCHAIN_PASSWORD`
- `APP_STORE_CONNECT_PRIVATE_KEY`
- `APP_STORE_CONNECT_API_KEY`
- `APP_STORE_TEAM_ID`
- `BUNDLE_ID`
- `PROVISIONIN_PROFILE_UUID`

A Mac device is needed to get the values of the secrets.

### Team Key
Team key can be found at [Apple developer portal](developer.apple.com/account) in `Membership Details` section. Set the `DEVELOPMENT_TEAM_ID` secret as this value

### Bundle Id
`BUNDLE_ID` secret is the bundle id of the iOS application.

### Keychain Password
`KEYCHAIN_PASSWORD` should be strong password for the temporary Keychain.

### Create App Store Connect Key
- Go to the [Apple Store portal](appstoreconnect.apple.com) and select `Integrations` from `Users and Access` section
- Create a `Team Key` from `App Store Connect API` tab
- The key id is `APP_STORE_CONNECT_API_KEY` secret
- Save the private key
- Get the base64 encoding of the `AuthKey_APP_STORE_CONNECT_API_KEY.p8`. The value is the `APP_STORE_CONNECT_PRIVATE_KEY` secret
```bash
base64 -i AuthKey_APP_STORE_CONNECT_API_KEY.p8
```
- There is an issuer id at the same page which is `APP_STORE_CONNECT_ISSUER_ID`

### Create Build Certificate And Password
- Go to the [Apple developer portal](developer.apple.com) and select `Certificates` from `Certificates,IDs&Profiles` section
- Create an `iOS Distribution` certificate
- Download the certificate and double-click to save it to the Keychain Access
- Open Keychain Access and locate the certificate in the `Certificates` tab of the `login` keychain. The name should start with `iPhone Distribution`
- Right-click to the certificate to export it as `.p12`
- During export process, Keychain Access asks for a password. Keep the password. The password is the `BUILD_CERTIFICATE_PASSWORD` secret.
- Get the base64 encoding of the `certificate.p12`. The value is the `BUILD_CERTIFICATE_BASE64` secret
```bash
base64 -i certificate.p12
```
### Create Provisioning Profile
- Go to the [Apple developer portal](https://developer.apple.com) and select `Profiles` from `Certificates,IDs&Profiles` section
- Create a provisioning profile for `App Store Connect` from `Distribution` section and continue
- Select the application id from the drop-down and continue
- Select the `iOS Distribution` certificate which is created in the previous steps and continue
- Provide a name for the provisioning profile and generate
- Download the profile and get base64 encoding of the provisioning profile. The value is the `BUILD_PROVISION_PROFILE_BASE64` secret
```bash
base64 -i distribution.mobileprovision
```
- Find UUID of the provisioning profile. The value is the `PROVISIONING_PROFILE_UUID` secret
```bash
grep UUID -A1 -a distribution_profile_name.mobileprovision
```
