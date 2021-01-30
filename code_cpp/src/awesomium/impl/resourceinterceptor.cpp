#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../resourceresponse.h"
#include "../resourceinterceptor.h"

namespace Awesomium
{

	ResourceResponse* ResourceInterceptor::OnRequest(void* request)
	{
		return 0;
	}
	bool  ResourceInterceptor::OnFilterNavigation(int origin_process_id, int origin_routing_id, const WebString& method, const WebURL& url, bool is_main_frame) {
		return false;
	}
	void  ResourceInterceptor::OnWillDownload(int origin_process_id, int origin_routing_id, const WebURL& url) {

	}

	ResourceInterceptor::~ResourceInterceptor() {}

}