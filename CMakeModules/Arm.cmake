if (ARM_INCLUDED)
  return()
endif (ARM_INCLUDED)
set(ARM_INCLUDED true)

set(ARM_VERSION "7" CACHE STRING "ARM processor version")
set(ARM_ARCH "" CACHE STRING "ARM architecture")
set(ARM_FPU "" CACHE STRING "ARM floating point hardware")
set(ARM_FLOAT_ABI "" CACHE STRING "ARM floating point mode")
set(ARM_TUNE "" CACHE STRING "ARM variant-specific tuning mode")
option(ARM_USE_NEON "Use the neon FPU instruction" ON)
option(ARM_USE_THUMB "Use the thumb instruction set" ON)

set(ARM_FLOAT_ABI_LIST hard soft softfp)
if (ARM_FLOAT_ABI AND NOT ${ARM_FLOAT_ABI} IN_LIST ARM_FLOAT_ABI_LIST)
  message(FATAL_ERROR "Unknown value '${ARM_FLOAT_ABI}' for variable ARM_FLOAT_ABI, options are: ${ARM_FLOAT_ABI_LIST}")
endif (ARM_FLOAT_ABI AND NOT ${ARM_FLOAT_ABI} IN_LIST ARM_FLOAT_ABI_LIST)

if (ARM_VERSION)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_VERSION="${ARM_VERSION}")
endif (ARM_VERSION)

if (ARM_ARCH)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_ARCH="${ARM_ARCH}")
endif (ARM_ARCH)

if (ARM_FPU)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_FPU="${ARM_FPU}")
endif (ARM_FPU)

if (ARM_FLOAT_ABI)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_FLOAT_ABI="${ARM_FLOAT_ABI}")
endif (ARM_FLOAT_ABI)

if (ARM_TUNE)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_TUNE="${ARM_TUNE}")
endif (ARM_TUNE)

if (ARM_USE_NEON)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_USE_NEON=ARM_USE_NEON)
endif (ARM_USE_NEON)

if (ARM_USE_THUMB)
  set(_WEBRTC_CMAKE_ARGS ${_WEBRTC_CMAKE_ARGS} -DARM_USE_THUMB=ARM_USE_THUMB)
endif (ARM_USE_THUMB)

list(APPEND LIBWEBRTC_DEFINITIONS WEBRTC_ARCH_ARM)
