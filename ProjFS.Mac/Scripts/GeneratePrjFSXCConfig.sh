VERSION=$1
if [ -z $VERSION ]; then
  VERSION="0.2.173.2"
fi

if [[ $VERSION =~ ([0-9])\.([0-9]*)\.([0-9]*)\.([0-9]*) ]]
then
  BUNDLE_VERSION="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}"
else
  echo "Failed to determine BUNDLE_VERSION from $VERSION"
  exit 1
fi

# Generate PrjFSConfig.xcconfig
SCRIPTDIR=$(dirname ${BASH_SOURCE[0]})
VERSIONCONFIG=$SCRIPTDIR/../../../BuildOutput/PrjFSConfig.xcconfig

echo "Generating $VERSIONCONFIG with bundle version $BUNDLE_VERSION and bundle short version string $VERSION"

cat >$VERSIONCONFIG <<TEMPLATE
// This file was generated by GeneratePrjFSXCConfig.sh

PRJFS_BUNDLE_VERSION = $BUNDLE_VERSION
PRJFS_BUNDLE_SHORT_VERSION_STRING = $VERSION
TEMPLATE
