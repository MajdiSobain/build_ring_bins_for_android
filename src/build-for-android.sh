#!/bin/bash

##################################################################################
#
#    build-for-android.sh usage:
#
#	$ ./build-for-android.sh path/to/ndk [api=21 [arch=arm]]
#
#	- path/to/ndk:	the absolute path to the android NDK folder (obligatory)
#	- api=21:	specify the version number of android API 9, 12, ...
#	- arch=arm:	specify the target arch that ring is going to 
#			run on. It should be one of:
#			{arm, arm64, mips, mips64, x86, x86_64}
#	Note: Arguments order should stictly be followed
#
#
#		by: Majdi.Sobain@gmail.com 2018
#
###################################################################################


toolchainsDir=$PWD/toolchains
orgPATH=$PATH
if [[ -n "$1" ]]; then
	ANDROID_NDK=$1;
	export ANDROID_NDK=$ANDROID_NDK;
else
	echo "Error: ANDROID_NDK not set";
	exit 0;
fi
APIn=21
if [[ -n "$2" ]]; then 
	APIn=${2#*=};
fi
if [[ -n "$3" ]]; then
	andrarch=arch-${3#*=};
else
	andrarch=arch-arm;
fi

case $andrarch in
	arch-arm)
		ARCH=arm
		ARCHTOOLCHAIN=arm-linux-androideabi-4.9
		CROSSCOMPILER=arm-linux-androideabi
		;;
	arch-arm64)
		ARCH=arm64
		ARCHTOOLCHAIN=aarch64-linux-android-4.9
		CROSSCOMPILER=aarch64-linux-android
		;;
	arch-x86)
		ARCH=x86
		ARCHTOOLCHAIN=x86-4.9
		CROSSCOMPILER=i686-linux-android
		;;
	arch-x86_64)
		ARCH=x86_64
		ARCHTOOLCHAIN=x86_64-4.9
		CROSSCOMPILER=x86_64-linux-android
		;;
	arch-mips)
		ARCH=mips
		ARCHTOOLCHAIN=mipsel-linux-android-4.9
		CROSSCOMPILER=mipsel-linux-android
		;;
	arch-mips64)
		ARCH=mips64
		ARCHTOOLCHAIN=mips64el-linux-android-4.9
		CROSSCOMPILER=mips64el-linux-android
		;;
esac

if [ ! -d "$toolchainsDir/android-$APIn/$ARCH" ]; then
	echo "###################################################"
	echo "#"
	echo "# Creating toolchain for android-$APIn arch $ARCH"
	echo "#"
	echo "###################################################"
	$ANDROID_NDK/build/tools/make-standalone-toolchain.sh --toolchain=$ARCHTOOLCHAIN --platform=android-$APIn --install-dir=$toolchainsDir/android-$APIn/$ARCH
fi

echo "###################################################"
echo "#"
echo "# Build ring for android-$APIn arch $ARCH"
echo "#"
echo "###################################################"
make clean

export PATH=$orgPATH:$toolchainsDir/android-$APIn/$ARCH/bin
export CC=${CROSSCOMPILER}-gcc
export AR=${CROSSCOMPILER}-ar
export LD=${CROSSCOMPILER}-ld

make

