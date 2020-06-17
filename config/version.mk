#
# Copyright (C) 2019 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Handle various build version information.
#

PA_VERSION_CODE := Alpha
ifeq ($(PA_BUILDTYPE), OFFICIAL)
  PA_BUILD_VARIANT := OFFICIAL
else
  PA_BUILD_VARIANT := UNOFFICIAL
endif

BUILD_DATE := $(shell date -u +%Y%m%d)
PA_VERSION := HyperParanoid-$(PA_VERSION_CODE)-$(PA_BUILD)-$(PA_BUILD_VARIANT)-$(BUILD_DATE)

# Paranoid Android System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pa.version=$(PA_VERSION)

# Paranoid Android Platform Display Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pa.version.code=$(PA_VERSION_CODE) \
    ro.pa.build.variant=$(PA_BUILD_VARIANT)

# Additional Properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.caf.version=$(shell grep "<default revision=" .repo/manifests/default.xml | cut -d '"' -f2 | cut -d "/" -f3)
