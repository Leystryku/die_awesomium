#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#pragma pack(push)
#pragma pack(1)

#include "webstringarray.h"

namespace Awesomium
{
	enum LogLevel {
		kLogLevel_None = 0,  ///< No log is created
		kLogLevel_Normal,    ///< Logs only errors
		kLogLevel_Verbose,   ///< Logs everything
	};

	struct DllExport WebConfig
	{
	public:
		WebConfig();

		LogLevel log_level;
		WebString package_path;
		WebString plugin_path;
		WebString log_path;
		WebString child_process_path;
		WebString user_agent;
		int remote_debugging_port;
		WebString remote_debugging_host;
		bool reduce_memory_usage_on_navigation;
		WebString user_script;
		WebString user_stylesheet;
		WebString asset_protocol;
		WebStringArray additional_options;
	};
}

#pragma pack(pop)