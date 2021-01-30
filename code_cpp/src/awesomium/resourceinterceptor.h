#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "resourceresponse.h"
#include "weburl.h"

namespace Awesomium
{
	class DllExport ResourceInterceptor
	{
	public:
		virtual Awesomium::ResourceResponse* OnRequest(void* request);
		virtual bool OnFilterNavigation(int origin_process_id, int origin_routing_id, const Awesomium::WebString& method, const Awesomium::WebURL& url, bool is_main_frame);
		virtual void OnWillDownload(int origin_process_id, int origin_routing_id, const Awesomium::WebURL& url);
		virtual ~ResourceInterceptor();
	};
}
