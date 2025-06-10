#!/usr/bin/env bash

# Requires:
#PACKAGE_NAME
#KEYSTORE_PASSWORD
#KEY_ALIAS
#ALIAS_PASSWORD
flutter build appbundle

pip install -r publish/requirements.txt

echo -n "$SERVICE_ACCOUNT_JSON" | base64 --decode >> publish/service_account.json

# Requires:
#PACKAGE_NAME
#SERVICE_ACCOUNT_JSON
python3 publish/publish_bundle_to_store.py $PACKAGE_NAME build/app/outputs/bundle/release/*.aab internal publish/service_account.json
