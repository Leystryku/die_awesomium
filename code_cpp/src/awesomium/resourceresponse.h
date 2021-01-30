#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webstring.h"

namespace Awesomium
{
	class DllExport ResourceResponse {
	public:
		ResourceResponse();
		static ResourceResponse* Create(unsigned int num_bytes, unsigned char* buffer, const WebString& mime_type);
		static ResourceResponse* Create(const WebString& file_path);
		static ResourceResponse* dummyresponse;
	protected:
		ResourceResponse(unsigned int num_bytes, unsigned char* buffer, const WebString& mime_type);
		ResourceResponse(const WebString& file_path);
		~ResourceResponse();
		unsigned int num_bytes_;
		unsigned char* buffer_;
		WebString mime_type_;
		WebString file_path_;
		friend class WebCoreImpl;
	};
}