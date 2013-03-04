project( MorphologicalOperators )
find_package( OpenCV REQUIRED )
add_executable( MorphologicalOperators MorphologicalOperators )
target_link_libraries( MorphologicalOperators ${OpenCV_LIBS} )
