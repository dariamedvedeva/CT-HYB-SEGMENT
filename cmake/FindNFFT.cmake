
SET(INCLUDE_SEARCH_PATHS
 $ENV{NFFT3_DIR}/include
 ${NFFT3_DIR}/include
 )

SET(LIBRARY_SEARCH_PATHS
 $ENV{NFFT3_DIR}/lib
 ${NFFT3_DIR}/lib
 )

FIND_PATH(NFFT3_INCLUDE_DIR nfft3.h ${INCLUDE_SEARCH_PATHS} DOC "NFFT include path")
FIND_LIBRARY(NFFT3_LIBRARIES nfft3 ${LIBRARY_SEARCH_PATHS} DOC "NFFT library path")

SET(NFFT3_INCLUDE_DIRS ${NFFT3_INCLUDE_DIR})
FIND_PACKAGE(FFTW3)
IF(FFTW3_FOUND)
    list(APPEND NFFT3_LIBRARIES ${FFTW3_LIBRARIES})
    list(APPEND NFFT3_INCLUDE_DIRS ${FFTW3_INCLUDE_DIRS})
ENDIF()

FIND_PACKAGE_HANDLE_STANDARD_ARGS(NFFT3 DEFAULT_MSG NFFT3_LIBRARIES NFFT3_INCLUDE_DIRS FFTW3_FOUND)
