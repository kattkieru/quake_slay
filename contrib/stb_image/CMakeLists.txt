
set(STB_IMAGE_SOURCES stb_image.c)
set(STB_IMAGE_HEADERS stb_image.h)

add_library(stb_image STATIC "${STB_IMAGE_SOURCES}" "${STB_IMAGE_HEADERS}")

install(FILES "${STB_IMAGE_HEADERS}" DESTINATION "${INSTALL_INC_DIR}")
