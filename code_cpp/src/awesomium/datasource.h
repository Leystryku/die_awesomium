#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webstring.h"

namespace Awesomium
{
	class WebSession;
	class ResourceRequest;

	class DllExport DataSource
	{
	public:
		virtual ~DataSource();
		virtual void OnRequest(int id, const ResourceRequest& request, const WebString& path);
		void SendResponse(int id, unsigned int buf, unsigned char* buff, const WebString& meme);
		void SendResponse(int id, unsigned int buf, unsigned char const* buff, class Awesomium::WebString const& meme);

	protected:
		DataSource();
		void set_session(WebSession* session, int data_source_id);
		WebSession* session_;
		int data_source_id;
		friend class WebSessionImpl;
	};
}