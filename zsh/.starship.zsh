# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
_distro="macos"
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
*debian*)                ICON="";;
*raspbian*)              ICON="";;
*ubuntu*)                ICON="";;
*fedora*)                ICON="";;
*coreos*)                ICON="";;
*centos*)                ICON="";;
*alpine*)                ICON="";;
*rhel*)                  ICON="";;
*macos*)                 ICON="";;
*)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"