
add_library(${MAIN_NAME} STATIC ${MAIN_SRCS})
target_include_directories(${MAIN_NAME} PUBLIC ${COMPONENT_REL_INCLUDES})

target_compile_options(${MAIN_NAME} PUBLIC %{CC_FLAGS}%)
target_compile_options(${MAIN_NAME} PUBLIC $<$<COMPILE_LANGUAGE:CXX>: %{CXX_FLAGS}% >)

