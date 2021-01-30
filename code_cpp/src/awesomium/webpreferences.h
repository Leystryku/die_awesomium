#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#pragma pack(push)
#pragma pack(1)

#include "webstring.h"

namespace Awesomium {
	struct DllExport WebPreferences
	{
		WebPreferences();
		int max_http_cache_storage;
		bool enable_javascript;
		bool enable_dart;
		bool enable_plugins;
		bool enable_local_storage;
		bool enable_databases;
		bool enable_app_cache;
		bool enable_web_audio;
		bool enable_web_gl;
		bool enable_web_security;
		bool enable_remote_fonts;
		bool enable_smooth_scrolling;
		bool enable_gpu_acceleration;
		WebString user_stylesheet;
		WebString user_script;
		WebString proxy_config;
		WebString accept_language;
		WebString accept_charset;
		WebString default_encoding;
		bool shrink_standalone_images_to_fit;
		bool load_images_automatically;
		bool allow_scripts_to_open_windows;
		bool allow_scripts_to_close_windows;
		bool allow_scripts_to_access_clipboard;
		bool allow_universal_access_from_file_url;
		bool allow_file_access_from_file_url;
		bool allow_running_insecure_content;

		static WebPreferences dummypreferences;
	};

}

#pragma pack(pop)