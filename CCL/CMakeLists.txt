project( ScanImage )
find_package( OpenCV REQUIRED )
add_executable( ScanImage ScanImage )
target_link_libraries( ScanImage ${OpenCV_LIBS} )
