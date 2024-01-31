set(PACKAGE_VERSION {{version_major}}.{{version_minor}}.{{version_patch}})

if (PACKAGE_VERSION VERSION_LESS PACKAGE_FIND_VERSION)
    set(PACKAGE_VERSION_COMPATIBLE False)
else()
    set(PACKAGE_VERSION_COMPATIBLE True)
    if (PACKAGE_VERSION STREQUAL PACKAGE_FIND_VERSION)
        set(PACKAGE_VERSION_EXACT True)
    endif()
endif()