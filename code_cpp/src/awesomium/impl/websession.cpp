#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../websession.h"
#include "../weburl.h"
#include "../webpreferences.h"
#include "../webstring.h"
#include "../datasource.h"

namespace Awesomium
{
	void WebSession::Release() const
	{
	};

	bool WebSession::IsOnDisk() const
	{
		return false;
	};

	WebString WebSession::data_path() const
	{
		return *WebString::dummystring;
	}
	const WebPreferences& WebSession::preferences() const
	{
		return WebPreferences::dummypreferences;
	}

	void WebSession::AddDataSource(const WebString& asset_host, DataSource* source)
	{
	};

	void WebSession::SetCookie(const WebURL& url, const WebString& cookie_string, bool is_http_only, bool force_session_cookie)
	{
	};

	void WebSession::ClearCookies()
	{
	};

	void WebSession::ClearCache()
	{
	};

	int WebSession::GetZoomForURL(const WebURL& url)
	{
		return 0;
	};

	WebSession::~WebSession()
	{
	}
}