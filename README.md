# filament-samples

## Background

The primary configuration this repo targets is Vulkan Wayland.  No other configurations have been tested.

The goal of this repo is to determine gaps for building a custom filament based app using Yocto.

## Usage with Yocto

Add this layer and recipe to your Vulkan Wayland based OS:

https://github.com/jwinarske/meta-vulkan/blob/main/recipes-graphics/filament/filament-samples-vk_git.bb

It will implicitly build filament-vk-native, filament-vk, and then filament-samples.


The installation path on target is "/usr/bin/filament-samples/"
