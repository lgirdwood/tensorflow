
# Copyright 2019 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This component was generated for the '%{EXECUTABLE}%' TF Micro example.
#

add_library(${MICROLITE_LIB_NAME} STATIC ${MICROLITE_LIB_SRCS})

# Reduce the level of paranoia to be able to compile TF sources
#target_compile_options(${MICROLITE_LIB_NAME}  -Wno-maybe-uninitialized
#  -Wno-missing-field-initializers
#  -Wno-type-limits)

target_include_directories(${MICROLITE_LIB_NAME} PUBLIC ${COMPONENT_INCLUDES})

target_compile_options(${MICROLITE_LIB_NAME} PUBLIC %{CC_FLAGS}%)
target_compile_options(${MICROLITE_LIB_NAME} PUBLIC $<$<COMPILE_LANGUAGE:CXX>: %{CXX_FLAGS}% >)
#target_compile_options(${MICROLITE_LIB_NAME} INTERFACE $<$<IN_LIST:-DTF_LITE_STATIC_MEMORY,$<TARGET_PROPERTY:${COMPONENT_LIB},COMPILE_OPTIONS>>:-DTF_LITE_STATIC_MEMORY>)
#target_link_libraries(${MICROLITE_LIB_NAME} PUBLIC %{LINKER_FLAGS}%)

