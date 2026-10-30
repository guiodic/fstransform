m4_define([FT_CXX_FLAGS],
  [
  case " $CXXFLAGS " in
    *" -std="*)
      AC_MSG_NOTICE([user-supplied CXXFLAGS already contains a -std= option, skipping C++ standard probe])
      ;;
    *)
      AC_CACHE_CHECK([for C++ standard flag],
        [ac_cv_cxx_std_flag],
        [ac_cv_cxx_std_flag=none
         for flag in -std=c++17 -std=c++14 -std=c++11 -std=c++0x; do
           save_CXXFLAGS="$CXXFLAGS"
           CXXFLAGS="$CXXFLAGS $flag"
           AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
          ]], [[
            return 0;
          ]])],
          [ac_cv_cxx_std_flag="$flag"
           CXXFLAGS="$save_CXXFLAGS"
           break],
          [CXXFLAGS="$save_CXXFLAGS"]
          )
         done
      ])
      if test "$ac_cv_cxx_std_flag" != "none"; then
        CXXFLAGS="$CXXFLAGS $ac_cv_cxx_std_flag"
      fi
      ;;
  esac

  AC_CACHE_CHECK([whether $CXX accepts -Wall],
    [ac_cv_cxx_flag_Wall],
    [save_CXXFLAGS="$CXXFLAGS"
     CXXFLAGS="$CXXFLAGS -Wall"
     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
    ]], [[
      return 0;
    ]])],
    [ac_cv_cxx_flag_Wall=yes],
    [ac_cv_cxx_flag_Wall=no
     CXXFLAGS="$save_CXXFLAGS"]
    )
  ])

  AC_CACHE_CHECK([whether $CXX accepts -Wextra],
    [ac_cv_cxx_flag_Wextra],
    [save_CXXFLAGS="$CXXFLAGS"
     CXXFLAGS="$CXXFLAGS -Wextra"
     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
    ]], [[
      return 0;
    ]])],
    [ac_cv_cxx_flag_Wextra=yes],
    [ac_cv_cxx_flag_Wextra=no
     CXXFLAGS="$save_CXXFLAGS"]
   )
 ])

  AC_CACHE_CHECK([whether $CXX accepts -W],
    [ac_cv_cxx_flag_W],
    [save_CXXFLAGS="$CXXFLAGS"
     CXXFLAGS="$CXXFLAGS -W"
     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
    ]], [[
      return 0;
    ]])],
    [ac_cv_cxx_flag_W=yes],
    [ac_cv_cxx_flag_W=no
     CXXFLAGS="$save_CXXFLAGS"]
   )
 ])

  AC_CACHE_CHECK([whether $CXX accepts -Wno-missing-field-initializers],
    [ac_cv_cxx_flag_Wno_missing_field_initializers],
    [save_CXXFLAGS="$CXXFLAGS"
     CXXFLAGS="$CXXFLAGS -Wno-missing-field-initializers"
     AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
    ]], [[
      return 0;
    ]])],
    [ac_cv_cxx_flag_Wno_missing_field_initializers=yes],
    [ac_cv_cxx_flag_Wno_missing_field_initializers=no
     CXXFLAGS="$save_CXXFLAGS"]
   )
 ])
])
