#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../resourcerequest.h"
#include "../uploadelement.h"
#include "../weburl.h"

namespace Awesomium
{

	WebURL* ResourceRequest::oururl = new WebURL;
	WebString* ResourceRequest::ourstring = new WebString;
	UploadElement* ResourceRequest::ourupload = new UploadElement;
	WebViewListener::View* ResourceRequest::ourview = new WebViewListener::View;
	WebViewListener::Load* ResourceRequest::ourload = new WebViewListener::Load;

	void ResourceRequest::Cancel()
	{
	};

	int ResourceRequest::origin_process_id()
	{
		return 1;
	};

	int ResourceRequest::origin_routing_id()
	{
		return 1;
	};

	WebURL ResourceRequest::url()
	{
		return *oururl;
	};

	WebString ResourceRequest::method()
	{
		return *ourstring;
	}

	void ResourceRequest::set_method(const WebString& method)
	{
	};

	WebString ResourceRequest::referrer() const
	{
		return *ourstring;
	};

	void ResourceRequest::set_referrer(const WebString& referrer)
	{
	};

	WebString ResourceRequest::extra_headers() const
	{
		return *ourstring;
	};

	void ResourceRequest::set_extra_headers(const WebString& headers)
	{
	};

	void ResourceRequest::AppendExtraHeader(const WebString& name, const WebString& value)
	{
	};

	unsigned int ResourceRequest::num_upload_elements() const
	{
		return 0;
	}
	const UploadElement* ResourceRequest::GetUploadElement(unsigned int idx) const
	{
		return ResourceRequest::ourupload;
	};

	void ResourceRequest::ClearUploadElements()
	{
	};

	void ResourceRequest::AppendUploadFilePath(const WebString& path)
	{
	};

	void ResourceRequest::AppendUploadBytes(const char* bytes, unsigned int num_bytes)
	{
	};

	void ResourceRequest::set_ignore_data_source_handler(bool ignore)
	{
	};


	ResourceRequest::~ResourceRequest()
	{
	}

}