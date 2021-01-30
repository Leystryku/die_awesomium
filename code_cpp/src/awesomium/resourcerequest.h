#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webviewlistener.h"

namespace Awesomium
{
	class WebURL;
	class WebString;
	class UploadElement;

	class DllExport ResourceRequest {
	public:
		virtual void Cancel();
		virtual int origin_process_id();
		virtual int origin_routing_id();
		virtual WebURL url();
		virtual WebString method();
		virtual void set_method(const WebString& method);
		virtual WebString referrer() const;
		virtual void set_referrer(const WebString& referrer);
		virtual WebString extra_headers() const;
		virtual void set_extra_headers(const WebString& headers);
		virtual void AppendExtraHeader(const WebString& name, const WebString& value);
		virtual unsigned int num_upload_elements() const;
		virtual const UploadElement* GetUploadElement(unsigned int idx) const;
		virtual void ClearUploadElements();
		virtual void AppendUploadFilePath(const WebString& path);
		virtual void AppendUploadBytes(const char* bytes, unsigned int num_bytes);
		virtual void set_ignore_data_source_handler(bool ignore);

		static WebURL* oururl;
		static WebString* ourstring;
		static UploadElement* ourupload;
		static WebViewListener::View* ourview;
		static WebViewListener::Load* ourload;
	protected:
		virtual ~ResourceRequest();
	};
}