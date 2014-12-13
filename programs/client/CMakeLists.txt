add_executable( nameshares_client main.cpp )
if( UNIX AND NOT APPLE )
  set(rt_library rt )
endif()

target_link_libraries( nameshares_client
                       PRIVATE bitcoin bts_keyhotee bts_wallet bts_rpc bts_cli bts_blockchain bts_db bts_net bts_client bts_utilities fc ${CMAKE_DL_LIBS} ${PLATFORM_SPECIFIC_LIBS} )
target_include_directories( nameshares_client 
                            PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include" )

IF(WIN32 AND "${TARGET_ARCHITECTURE}" STREQUAL "x86")
  SET_TARGET_PROPERTIES(nameshares_client PROPERTIES LINK_FLAGS "/LARGEADDRESSAWARE")
ENDIF()

if (ENABLE_INSTALLER)
  install(TARGETS nameshares_client RUNTIME DESTINATION bin)
endif(ENABLE_INSTALLER)
