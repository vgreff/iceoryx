if(UNIX AND NOT APPLE)
    if(CMAKE_SYSTEM_NAME MATCHES Linux)
        set(LINUX true)
    elseif(CMAKE_SYSTEM_NAME MATCHES QNX)
        set(QNX true)
    endif()
endif(UNIX AND NOT APPLE)

if(LINUX)
    set(ICEORYX_CXX_STANDARD 11)
elseif(QNX)
    set(ICEORYX_CXX_STANDARD 11)
elseif(WIN32)
    set(ICEORYX_CXX_STANDARD 11)
elseif(APPLE)
    set(ICEORYX_CXX_STANDARD 17)
endif(LINUX)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    set(TEST_CXX_FLAGS ${ICEORYX_WARNINGS} /W3)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    set(TEST_CXX_FLAGS PRIVATE ${ICEORYX_WARNINGS} -W -Wall -Wextra -Wuninitialized -Wpedantic -Wstrict-aliasing -Wcast-align -Wno-noexcept-type -Wconversion)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(TEST_CXX_FLAGS PRIVATE ${ICEORYX_WARNINGS} -W -Wall -Wextra -Wuninitialized -Wpedantic -Wstrict-aliasing -Wcast-align -Wno-noexcept-type)
endif()

if(BUILD_STRICT)
    if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        set(ICEORYX_WARNINGS ${ICEORYX_WARNINGS} /WX)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        set(ICEORYX_WARNINGS ${ICEORYX_WARNINGS} -Werror)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(ICEORYX_WARNINGS ${ICEORYX_WARNINGS} -Werror)
    endif (  )
endif(BUILD_STRICT)
