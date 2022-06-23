#################################################################################
###
##
# * android
##
###

local ANDROID_ALIAS_DIR=$(dirname $0)/android-aliases

#########################################
##
# *** AndroidVirtualDevices
##
alias avdd="avdmanager list devices"
alias avdl="avdmanager list avd"
alias pixel="${ANDROID_ALIAS_DIR}/emulator -avd Pixel_3a_API_30_x86"
alias pixelg="${ANDROID_ALIAS_DIR}/emulator -avd Pixel_3a_API_30_x86 -gpu host"
