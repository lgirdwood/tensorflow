cmake_minimum_required(VERSION 3.12.0)
#include($ENV{SOF_PATH}/tools/cmake/project.cmake)

project(%{EXECUTABLE}%)

set(MICROLITE_LIB_NAME %{CMAKE_MICROLITE_LIB_NAME}%)
set(MICROLITE_LIB_SRCS %{MICROLITE_SRCS}%)
set(COMPONENT_INCLUDES %{COMPONENT_INCLUDES}%)
set(COMPONENT_REL_INCLUDES %{COMPONENT_REL_INCLUDES}%)
set(MAIN_SRCS %{MAIN_SRCS}%)
set(MAIN_NAME %{EXECUTABLE}%)
set(SOF_MAIN_SRCS %{SOF_MAIN_SRCS}%)
set(SOF_DIR "~/work/sof/sof")

set(CMAKE_C_COMPILER %{CROSS_COMPILE}%cc)
set(CMAKE_CXX_COMPILER %{CROSS_COMPILE}%c++)

find_program(CMAKE_LD NAMES "%{CROSS_COMPILE}%ld" PATHS ENV PATH NO_DEFAULT_PATH)
find_program(CMAKE_AR NAMES "%{CROSS_COMPILE}%ar" PATHS ENV PATH NO_DEFAULT_PATH)
find_program(CMAKE_RANLIB NAMES "%{CROSS_COMPILE}%ranlib" PATHS ENV PATH NO_DEFAULT_PATH)
find_program(CMAKE_OBJCOPY NAMES "%{CROSS_COMPILE}%objcopy" PATHS ENV PATH NO_DEFAULT_PATH)
find_program(CMAKE_OBJDUMP NAMES "%{CROSS_COMPILE}%objdump" PATHS ENV PATH NO_DEFAULT_PATH)

#message(WARNING COMPONENT_SRCS %{COMPONENT_SRCS}%)

#message(WARNING MAIN_SRCS %{MAIN_SRCS}%)

#message(WARNING COMPONENT_INCLUDES %{COMPONENT_INCLUDES}%)

#message(WARNING LINKER_FLAGS %{LINKER_FLAGS}%)

message(WARNING CXX_FLAGS %{CXX_FLAGS}%)

message(WARNING CC_FLAGS %{CC_FLAGS}%)

#message(WARNING MICROLITE_HDRS %{MICROLITE_HDRS}%)

#message(WARNING PROJECT_SRCS %{PROJECT_SRCS}%)

#message(WARNING PROJECT_HDRS %{PROJECT_HDRS}%)

#message(WARNING COMPONENT_REL_INCLUDES %{COMPONENT_REL_INCLUDES}%)

add_subdirectory(tfmicro)

add_subdirectory(main)

#add_library(tf-speech STATIC ${MICROLITE_LIB_SRCS})

add_custom_target(tf-speech ALL
    COMMAND ${CMAKE_LD} -e app_main -L /home/lrg/work/sof/xtensa-cnl-elf/xtensa-cnl-elf/lib/ -r main/libmicro_speech.a tfmicro/libtensorflow-microlite.a -lstdc++ -S -o tf-speech.a
  
    DEPENDS ${MICROLITE_LIB_NAME} ${MAIN_NAME}

    # to make quotes printable,for example
    VERBATIM
)

#add_executable(sof-test ${SOF_MAIN_SRCS})
#target_link_options(sof-test PUBLIC -Ltfmicro -Lmain)
#target_link_libraries(sof-test PUBLIC ${MAIN_NAME} ${MICROLITE_LIB_NAME})
