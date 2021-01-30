#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webpreferences.h"
#include "webstring.h"
#include "weburl.h"
#include "datasource.h"

namespace Awesomium {
	class DllExport WebSession
	{
	public:
		virtual void Release() const;
		virtual bool IsOnDisk() const;
		virtual WebString data_path() const;
		virtual const WebPreferences& preferences() const;
		virtual void AddDataSource(const WebString& asset_host, DataSource* source);
		virtual void SetCookie(const WebURL& url, const WebString& cookie_string, bool is_http_only, bool force_session_cookie);
		virtual void ClearCookies();
		virtual void ClearCache();
		virtual int GetZoomForURL(const WebURL& url);
	protected:
		virtual ~WebSession();
	};
}