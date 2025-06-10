import argparse
import sys

# Set your values here or use environment variables
arg_parser = argparse.ArgumentParser(add_help=False)
arg_parser.add_argument(
    "--team-id", required=True, help="Apple Store Development Team Id"
)
arg_parser.add_argument("--bundle-id", required=True, help="iOS Project Bundle Id")
arg_parser.add_argument(
    "--profile-uuid", required=True, help="Provisioning Profile UUID"
)


def create(argv):
    flags = arg_parser.parse_args()
    team_id = flags.team_id
    bundle_id = flags.bundle_id
    profile_uuid = flags.profile_uuid

    template_path = "ios/ExportOptionsTemplate.plist"
    output_path = "ios/ExportOptions.plist"

    with open(template_path, "r") as file:
        content = file.read()

    print(team_id)
    content = content.replace("TEAM_ID", team_id)
    content = content.replace("BUNDLE_ID", bundle_id)
    content = content.replace("PROFILE_UUID", profile_uuid)

    with open(output_path, "w") as file:
        file.write(content)


if __name__ == "__main__":
    create(sys.argv)
