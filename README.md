# Building Ring binaries for android

These scripts help building ring binary and its VM libraries for android.

These scripts needs to be copied to the src folder of Ring folder hierarchy.

Note: these scripts have been tested with (Ring 1.19 source code) and (Android NDK v14.1.3816874) on (Linux Mint 21)

Note: Ring built with shared lib link will not work unless the link is hard coded and correctly specified in the target android file system

## Prerequisites

- automake
- libncurses5
- android ndk

## Usage

For building ring binaries just type:

	make


For building ring binaries for android use build-for-android.sh script:

	./build-for-android.sh path/to/ndk [api=21 [arch=arm]]
	
	#	- path/to/ndk:	the absolute path to the android NDK folder (obligatory)
	#	- api=21:	specify the version number of android API 9, 12, ...
	#	- arch=arm:	specify the target arch that ring is going to 
	#			run on. It should be one of:
	#			{arm, arm64, mips, mips64, x86, x86_64}
	#	Note: Arguments order should stictly be followed
 

Enjoy :)	
